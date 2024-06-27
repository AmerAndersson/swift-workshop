import Foundation
/**
** Macros
Use macros to generate code at compile time.
Macros transform your source code when you compile it, letting you avoid writing repetitive code by hand.
During compilation, Swift expands any macros in your code before building your code as usual.

Expanding a macro is always an additive operation: Macros add new code, but they never delete or modify existing code.

Both the input to a macro and the output of macro expansion are checked to ensure they’re syntactically valid Swift code. Likewise, the values you pass to a macro and the values in code generated by a macro are checked to ensure they have the correct types. In addition, if the macro’s implementation encounters an error when expanding that macro, the compiler treats this as a compilation error. These guarantees make it easier to reason about code that uses macros, and they make it easier to identify issues like using a macro incorrectly or a macro implementation that has a bug.

** Swift has two kinds of macros:

** Freestanding macros appear on their own, without being attached to a declaration.

** Attached macros modify the declaration that they’re attached to.

You call attached and freestanding macros slightly differently, but they both follow the same model for macro expansion, and you implement them both using the same approach.

Freestanding macros can produce a value, like #function does, or they can perform an action at compile time, like #warning does
*/
func logFunctionName(string: String = #function) {
    print(string)
}
func myFunction() {
    logFunctionName() // Prints "myFunction()".
}
myFunction()

func myFunctions() {
    print("Currently running \(#function)")
    //#warning("Something's wrong")
}
myFunctions()

/**
** Attached Macros
To call an attached macro, you write an at sign (@) before its name, and you write any arguments to the macro in parentheses after its name. Attached macros modify the declaration that they’re attached to. They add code to that declaration, like defining a new method or adding conformance to a protocol.
*/
 
// This version of SundaeToppings calls an @OptionSet macro. 
// The macro reads the list of cases in the private enumeration,
// generates the list of constants for each option, and adds a conformance to the OptionSet protocol.

@OptionSet<Int>
struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }
}

struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }


    typealias RawValue = Int
    var rawValue: RawValue
    init() { self.rawValue = 0 }
    init(rawValue: RawValue) { self.rawValue = rawValue }
    static let nuts: Self = Self(rawValue: 1 << Options.nuts.rawValue)
    static let cherry: Self = Self(rawValue: 1 << Options.cherry.rawValue)
    static let fudge: Self = Self(rawValue: 1 << Options.fudge.rawValue)
}
extension SundaeToppings: OptionSet { }
extension SundaeToppings: ExpressibleByIntegerLiteral {
  init(integerLiteral value: Int) {
    self.rawValue = value
  }
}

/**
** Macro Declarations
For macros, the declaration and implementation are separate. A macro’s declaration contains its name, the parameters it takes, where it can be used, and what kind of code it generates. A macro’s implementation contains the code that expands the macro by generating Swift code. You introduce a macro declaration with the macro keyword. Here’s part of the declaration for the @OptionSet 

The first line specifies the macro’s name and its arguments — the name is OptionSet, and it doesn’t take any arguments. The second line uses the externalMacro(module:type:) macro from the Swift standard library to tell Swift where the macro’s implementation is located. In this case, the SwiftMacros module contains a type named OptionSetMacro, which implements the @OptionSet macro.

Because OptionSet is an attached macro, its name uses upper camel case, like the names for structures and classes. Freestanding macros have lower camel case names, like the names for variables and functions.

** Note
Macros are always declared ``as public``. Because the code that declares a macro is in a different module from code that uses that macro, there isn’t anywhere you could apply a nonpublic macro
*/
public macro OptionSet<RawType>() =
        #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")

/**
A macro declaration defines the macro’s roles — the places in source code where that macro can be called, and the kinds of code the macro can generate. Every macro has one or more roles, which you write as part of the attributes at the beginning of the macro declaration. Here’s a bit more of the declaration for @OptionSet, including the attributes for its roles:

The @attached attribute appears twice in this declaration, once for each macro role. The first use, @attached(member), indicates that the macro adds new members to the type you apply it to. The @OptionSet macro adds an init(rawValue:) initializer that’s required by the OptionSet protocol, as well as some additional members. The second use, @attached(extension, conformances: OptionSet), tells you that @OptionSet adds conformance to the OptionSet protocol. The @OptionSet macro extends the type that you apply the macro to, to add conformance to the OptionSet protocol.
*/
@attached(member)
@attached(extension, conformances: OptionSet)
public macro OptionSet<RawType>() =
        #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")

// For a freestanding macro, you write the @freestanding attribute to specify its role
// The #line macro above has the expression role. An expression macro produces a value,
// or performs a compile-time action like generating a warning.
@freestanding(expression)
public macro line<T: ExpressibleByIntegerLiteral>() -> T = location 
        /* ... location of the macro implementation... */


/**
In addition to the macro’s role, a macro’s declaration provides information about the names of the symbols that the macro generates. When a macro declaration provides a list of names, it’s guaranteed to produce only declarations that use those names, which helps you understand and debug the generated code. Here’s the full declaration of @OptionSet:

In the declaration, the @attached(member) macro includes arguments after the named: label for each of the symbols that the @OptionSet macro generates. The macro adds declarations for symbols named RawValue, rawValue, and init — because those names are known ahead of time, the macro declaration lists them explicitly.

The macro declaration also includes arbitrary after the list of names, allowing the macro to generate declarations whose names aren’t known until you use the macro. For example, when the @OptionSet macro is applied to the SundaeToppings above, it generates type properties that correspond to the enumeration cases, nuts, cherry, and fudge.
*/
@attached(member, names: named(RawValue), named(rawValue), named(`init`), arbitrary)
@attached(extension, conformances: OptionSet)
public macro OptionSet<RawType>() =
        #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")


/**
** Macro Expansion
When building Swift code that uses macros, the compiler calls the macros’ implementation to expand them.
Specifically, Swift expands macros in the following way:

1- The compiler reads the code, creating an in-memory representation of the syntax.
2- The compiler sends part of the in-memory representation to the macro implementation, which expands the macro.
3- The compiler replaces the macro call with its expanded form.
4- The compiler continues with compilation, using the expanded source code.
*/

/**
** To go through the specific steps, consider the following
The #fourCharacterCode macro takes a string that’s four characters long and returns an unsigned 32-bit integer that corresponds to the ASCII values in the string joined together. Some file formats use integers like this to identify data because they’re compact but still readable in a debugger. The Implementing a Macro section below shows how to implement this macro.

To expand the macros in the code above, the compiler reads the Swift file and creates an in-memory representation of that code known as an`` abstract syntax tree, or AST. The AST`` makes the code’s structure explicit, which makes it easier to write code that interacts with that structure — like a compiler or a macro implementation. 
*/
let magicNumber = #fourCharacterCode("ABCD")
/**
** A representation of the AST for the code above, slightly simplified by omitting some extra detail:
The diagram above shows how the structure of this code is represented in memory. Each element in the AST corresponds to a part of the source code. The “Constant declaration” AST element has two child elements under it, which represent the two parts of a constant declaration: its name and its value. The “Macro call” element has child elements that represent the macro’s name and the list of arguments being passed to the macro.

- Constant declaration
    - constant name: magicNumber 
    - constant: value
      - Macro call
       - Macro name: fourCharacterCode
       - Macro: arguments
          - String literal: "ABCD"

As part of constructing this AST, the compiler checks that the source code is valid Swift. For example, #fourCharacterCode takes a single argument, which must be a string. If you tried to pass an integer argument, or forgot the quotation mark (") at the end of the string literal, you’d get an error at this point in the process.

The compiler finds the places in the code where you call a macro, and loads the external binary that implements those macros. For each macro call, the compiler passes part of the AST to that macro’s implementation. Here’s a representation of that partial AST:

- Macro call
  - Macro name: fourCharacterCode
  - Macro: arguments
    - String literal: "ABCD"

The implementation of the #fourCharacterCode macro reads this partial AST as its input when expanding the macro. A macro’s implementation operates only on the partial AST that it receives as its input, meaning a macro always expands the same way regardless of what code comes before and after it. This limitation helps make macro expansion easier to understand, and helps your code build faster because Swift can avoid expanding macros that haven’t changed.

Swift helps macro authors avoid accidentally reading other input by restricting the code that implements macros:
The AST passed to a macro implementation contains only the AST elements that represent the macro, not any of the code that comes before or after it.
The macro implementation runs in a sandboxed environment that prevents it from accessing the file system or the network.
In addition to these safeguards, the macro’s author is responsible for not reading or modifying anything outside of the macro’s inputs. For example, a macro’s expansion must not depend on the current time of day.
The implementation of #fourCharacterCode generates a new AST containing the expanded code. Here’s what that code returns to the compiler:

 - Integer literal: "1145258561"

 When the compiler receives this expansion, it replaces the AST element that contains the macro call with the element that contains the macro’s expansion. After macro expansion, the compiler checks again to ensure the program is still syntactically valid Swift and all the types are correct. That produces a final AST that can be compiled as usual:

  -Constant declaration
    - constant name: magicNumber 
    - constant: value
     - Integer literal: "1145258561"
     - Type: UInt32
*/

// This AST corresponds to Swift code like this:
let magicNumber = 1145258561 as UInt32
/**
In this example, the input source code has only one macro, but a real program could have several instances of the same macro and several calls to different macros. The compiler expands macros one at a time.
If one macro appears inside another, the outer macro is expanded first — this lets the outer macro modify the inner macro before it’s expanded.
*/