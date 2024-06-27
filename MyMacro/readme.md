
# Implementing a Macro

To implement a macro, you make two components: A type that performs the macro expansion, and a library that declares the macro to expose it as API. These parts are built separately from code that uses the macro, even if you’re developing the macro and its clients together, because the macro implementation runs as part of building the macro’s clients.

To create a new macro using Swift Package Manager, run swift package init --type macro — this creates several files, including a template for a macro implementation and declaration.

To add macros to an existing project, edit the beginning of your Package.swift file as follows:

Set a Swift tools version of 5.9 or later in the swift-tools-version comment.

Import the CompilerPluginSupport module.

Include macOS 10.15 as a minimum deployment target in the platforms list.

The code below shows the beginning of an example Package.swift file.

```swift
Next, add a target for the macro implementation and a target for the macro library to your existing Package.swift file. For example, you can add something like the following, changing the names to match your project:

The code above defines two targets:`MyMacroMacros` contains the implementation of the macros, and `MyMacro` makes those macros available.

The implementation of a macro uses the SwiftSyntax module to interact with Swift code in a structured way, using an AST. If you created a new macro package with Swift Package Manager, the generated Package.swift file automatically includes a dependency on SwiftSyntax. If you’re adding macros to an existing project, add a dependency on SwiftSyntax in your Package.swift file:

The #fourCharacterCode macro is a freestanding macro that produces an expression, so the FourCharacterCode type that implements it conforms to the ExpressionMacro protocol. The ExpressionMacro protocol has one requirement, an expansion(of:in:) method that expands the AST. For the list of macro roles and their corresponding SwiftSyntax protocols, see attached and freestanding in Attributes.

To expand the #fourCharacterCode macro, Swift sends the AST for the code that uses this macro to the library that contains the macro implementation. Inside the library, Swift calls FourCharacterCode.expansion(of:in:), passing in the AST and the context as arguments to the method. The implementation of expansion(of:in:) finds the string that was passed as an argument to #fourCharacterCode and calculates the corresponding 32-bit unsigned integer literal value.

In the example above, the first guard block extracts the string literal from the AST, assigning that AST element to literalSegment. The second guard block calls the private fourCharacterCode(for:) function. Both of these blocks throw an error if the macro is used incorrectly — the error message becomes a compiler error at the malformed call site. For example, if you try to call the macro as #fourCharacterCode("AB" + "CD") the compiler shows the error “Need a static string”.

The expansion(of:in:) method returns an instance of ExprSyntax, a type from SwiftSyntax that represents an expression in an AST. Because this type conforms to the StringLiteralConvertible protocol, the macro implementation uses a string literal as a lightweight syntax to create its result. All of the SwiftSyntax types that you return from a macro implementation conform to StringLiteralConvertible, so you can use this approach when implementing any kind of macro.
```

```swift
$ mkdir MyMacro
$ cd MyMacro
$ swift package init --type macro
$ swift build
$ swift run

Creating macro package: MyMacro
Creating Package.swift
Creating .gitignore
Creating Sources/
Creating Sources/MyMacro/MyMacro.swift
Creating Sources/MyMacroMacros/MyMacroMacro.swift
Creating Sources/MyMacroClient/main.swift
Creating Tests/
Creating Tests/MyMacroTests/
Creating Tests/MyMacroTests/MyMacroTests.swift

```
