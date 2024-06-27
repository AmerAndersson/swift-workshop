// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #fourCharacterCode("ABCD")
///
/// produces a tuple `(x + y, "x + y")`.
// let magicNumber = #fourCharacterCode("ABCD")
@freestanding(expression)
public macro fourCharacterCode<T>(_ value: T) -> (T, String) = #externalMacro(module: "MyMacroMacros", type: "fourCharacterCodeMacro") 