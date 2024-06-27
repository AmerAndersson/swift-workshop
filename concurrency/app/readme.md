# Swift language command line
  
  swift build      Build Swift packages
  swift package    Create and work on packages
  swift run        Run a program from a package
  swift test       Run package tests
  swift repl       Experiment with Swift code interactively

  Use `swift --help` for descriptions of available options and flags.

  Use `swift help <subcommand>` for more information about a subcommand.

## Numeric Type Conversion

Use the Int type for all general-purpose integer constants and variables in your code, even if they’re known to be nonnegative. Using the default integer type in everyday situations means that integer constants and variables are immediately interoperable in your code and will match the inferred type for integer literal values.

Use other integer types only when they’re specifically needed for the task at hand, because of explicitly sized data from an external source, or for performance, memory usage, or other necessary optimization. Using explicitly sized types in these situations helps to catch any accidental value overflows and implicitly documents the nature of the data being used.

## Floating-point literals

Floating-point literals can be decimal (with no prefix), or hexadecimal (with a 0x prefix). They must always have a number (or hexadecimal number) on both sides of the decimal point. Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e; hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p.

For decimal numbers with an exponent of x, the base number is multiplied by 10ˣ:

1.25e2 means 1.25 x 10², or 125.0.

1.25e-2 means 1.25 x 10⁻², or 0.0125.

For hexadecimal numbers with an exponent of x, the base number is multiplied by 2ˣ:

0xFp2 means 15 x 2², or 60.0.

0xFp-2 means 15 x 2⁻², or 3.75.

All of these floating-point literals have a decimal value of 12.1875:

## Integer Conversion

The range of numbers that can be stored in an integer constant or variable is different for each numeric type. An Int8 constant or variable can store numbers between -128 and 127, whereas a UInt8 constant or variable can store numbers between 0 and 255. A number that won’t fit into a constant or variable of a sized integer type is reported as an error when your code is compiled:

## Note

Tuples are useful for simple groups of related values. They’re not suited to the creation of complex data structures. If your data structure is likely to be more complex, model it as a class or structure, rather than as a tuple

The values within a tuple can be of any type and don’t have to be of the same type as each other.
In this example, (404, "Not Found") is a tuple that describes an HTTP status code. An HTTP status code is a special value returned by a web server whenever you request a web page. A status code of 404 Not Found is returned if you request a webpage that doesn’t exist.
Tuples are particularly useful as the return values of functions. A function that tries to retrieve a web page might return the (Int, String) tuple type to describe the success or failure of the page retrieval. By returning a tuple with two distinct values, each of a different type, the function provides more useful information about its outcome than if it could only return a

## Optionals

You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value of a specified type, and you can unwrap the optional to access that value, or there isn’t a value at all.

As an example of a value that might be missing, Swift’s Int type has an initializer that tries to convert a String value into an Int value. However, only some strings can be converted into integers. The string "123" can be converted into the numeric value 123, but the string "hello, world" doesn’t have a corresponding numeric value. The example below uses the initializer to try to convert a String into an Int

You can’t use nil with non-optional constants or variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, declare it as an optional value of the appropriate type. A constant or variable that’s declared as a non-optional value is guaranteed to never contain a nil value. If you try to assign nil to a non-optional value, you’ll get a compile-time error.

This separation of optional and non-optional values lets you explicitly mark what information can be missing, and makes it easier to write code that handle missing values. You can’t accidentally treat an optional as if it were non-optional because this mistake produces an error at compile time. After you unwrap the value, none of the other code that works with that value needs to check for nil, so there’s no need to repeatedly check the same value in different parts of your code.

When you access an optional value, your code always handles both the nil and non-nil case. There are several things you can do when a value is missing, as described in the following sections:

- Skip the code that operates on the value when it’s nil.

- Propagate the nil value, by returning nil or using the ?.

- Provide a fallback value, using the ?? operator.

- Stop program execution, using the ! operator.

## Notes

In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil isn’t a pointer — it’s the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types

## You’re welcome! If you have any more questions or need further assistance, feel free to ask. Have a great day! 😊
