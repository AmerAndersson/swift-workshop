# Freestanding Macros

To call a freestanding macro, you write a number sign (#) before its name, and you write any arguments to the macro in parentheses after its name

In the first line, #function calls the function() macro from the Swift standard library. When you compile this code, Swift calls that macro’s implementation, which replaces #function with the name of the current function. When you run this code and call myFunction(), it prints “Currently running myFunction()”. In the second line, #warning calls the warning(_:) macro from the Swift standard library to produce a custom compile-time warning.

```swift

Consider the following code that doesn’t use macros:
 
struct SundaeToppings: OptionSet {
    let rawValue: Int
    static let nuts = SundaeToppings(rawValue: 1 << 0)
    static let cherry = SundaeToppings(rawValue: 1 << 1)
    static let fudge = SundaeToppings(rawValue: 1 << 2)
}

let mySundaeToppings: SundaeToppings = [.nuts, .cherry, .fudge]
print(mySundaeToppings)
```

## Attached Macros

To call an attached macro, you write an at sign (@) before its name, and you write any arguments to the macro in parentheses after its name.

Attached macros modify the declaration that they’re attached to. They add code to that declaration, like defining a new method or adding conformance to a protocol.

For example, consider the following code that doesn’t use macros:

## Macro Declarations

In most Swift code, when you implement a symbol, like a function or type, there’s no separate declaration. However, for macros, the declaration and implementation are separate. A macro’s declaration contains its name, the parameters it takes, where it can be used, and what kind of code it generates. A macro’s implementation contains the code that expands the macro by generating Swift code.

You introduce a macro declaration with the macro keyword. For example, here’s part of the declaration for the @OptionSet macro used in the previous example:

```swift

public macro OptionSet<RawType>() =
        #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")
```

The first line specifies the macro’s name and its arguments — the name is OptionSet, and it doesn’t take any arguments. The second line uses the externalMacro(module:type:) macro from the Swift standard library to tell Swift where the macro’s implementation is located. In this case, the SwiftMacros module contains a type named OptionSetMacro, which implements the @OptionSet macro.

Because OptionSet is an attached macro, its name uses upper camel case, like the names for structures and classes. Freestanding macros have lower camel case names, like the names for variables and functions.

## Note

Macros are always declared as public. Because the code that declares a macro is in a different module from code that uses that macro, there isn’t anywhere you could apply a nonpublic macro.

```swift
@CaseDetection
enum Path {
  case relative(String)
  case absolute(String)

  var isAbsolute: bool {
    if case .absolute = self { true }
    else { false }
  }

  var isRelative: bool {
    if case .relative = self { true }
    else { false }
  }
}

let absPath = path.filter { $0.isAbsolute }
let relPath = path.filter { $0.isRelative }
```
