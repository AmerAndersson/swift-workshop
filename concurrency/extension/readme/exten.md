
# Note

```s
Extensions can add new computed properties, but they can’t add stored properties, or add property observers to existing properties.

** Computed Properties
Extensions can add computed instance properties and computed type properties to existing types.
This example adds five computed instance properties to Swift’s built-in Double type, to provide basic support for working with distance units:

These computed properties express that a Double value should be considered as a certain unit of length. Although they’re implemented as computed properties, the names of these properties can be appended to a floating-point literal value with dot syntax, as a way to use that literal value to perform distance conversions.

In this example, a Double value of 1.0 is considered to represent “one meter”. This is why the m computed property returns self — the expression 1.m is considered to calculate a Double value of 1.0.

Other units require some conversion to be expressed as a value measured in meters. One kilometer is the same as 1,000 meters, so the km computed property multiplies the value by 1_000.00 to convert into a number expressed in meters. Similarly, there are 3.28084 feet in a meter, and so the ft computed property divides the underlying Double value by 3.28084, to convert it from feet to meters.

These properties are read-only computed properties, and so they’re expressed without the get keyword, for brevity. Their return value is of type Double, and can be used within mathematical calculations wherever a Double is accepted:


Feet (ft)	Meters (m)
0.01 ft	0.003048 m
0.1 ft	0.03048 m
1 ft	0.3048 m
2 ft	0.6096 m
3 ft	0.9144 m
4 ft	1.2192 m
5 ft	1.5240 m
6 ft	1.8288 m
7 ft	2.1336 m
8 ft	2.4384 m
9 ft	2.7432 m
10 ft	3.048 m
20 ft	6.096 m
30 ft	9.144 m
40 ft	12.192 m
50 ft	15.240 m
60 ft	18.288 m
70 ft	21.336 m
80 ft	24.384 m
90 ft	27.432 m
100 ft	30.480 m
```

```s
Let's dive into the concepts of **escaping** and **non-escaping** closures in Swift.

1. **Escaping Closures**:
   - An **escaping closure** is a closure that outlives the function or scope in which it is defined.
   - When you pass an escaping closure as an argument to a function, the closure can be stored beyond the lifetime of that function.
   - Common use cases for escaping closures include asynchronous operations (e.g., network requests, animations) and completion handlers.
   - To declare an escaping closure, use the `@escaping` attribute before the closure type in the function signature.

2. **Non-Escaping Closures**:
   - A **non-escaping closure** is a closure that is executed within the same function or scope where it is defined.
   - Non-escaping closures are typically used synchronously and do not outlive the function.
   - By default, closures are non-escaping unless explicitly marked as escaping.
   - Non-escaping closures are more memory-efficient because they don't need to be retained beyond their immediate context.



3. **Capture Lists and Escaping Closures**:
   - When an escaping closure captures values from its surrounding context (e.g., captures variables), you need to be mindful of potential retain cycles.
   - Use capture lists (e.g., `[weak self]`, `[unowned self]`) to break strong reference cycles when capturing `self` inside escaping closures.

4. **Summary**:
   - **Escaping Closures**:
     - Outlive the function or scope where they are defined.
     - Useful for asynchronous tasks and completion handlers.
     - Marked with `@escaping`.
   - **Non-Escaping Closures**:
     - Executed within the same function or scope.
     - Default behavior for closures.
     - Efficient and don't require additional memory management.

Remember to choose the appropriate type of closure based on your use case. Escaping closures are essential for handling asynchronous operations, while non-escaping closures are great for synchronous tasks. 😊


Let's explore the differences between **closures** and **functions** in Swift:

1. **Definition**:
   - **Function**:
     - A function is a named block of code that performs a specific task.
     - Functions can be defined globally or within a class, struct, or enum.
     - They have a name, parameters, and a return type.
   - **Closure**:
     - A closure is an anonymous (unnamed) block of code that can be assigned to a variable or passed as an argument to functions.
     - Closures capture and store references to variables and constants from their surrounding context.

2. **Syntax**:
   - **Function**:
     ```swift
     func greet(name: String) -> String {
         return "Hello, \(name)!"
     }
     ```
   - **Closure**:
     ```swift
     let greetClosure: (String) -> String = { name in
         return "Hello, \(name)!"
     }
     ```

3. **Naming**:
   - **Function**:
     - Functions have a specific name (e.g., `greet` in the example above).
     - You call them using that name.
   - **Closure**:
     - Closures are anonymous by default.
     - You assign them to variables or pass them directly without a name.

4. **Use Cases**:
   - **Function**:
     - Use functions for reusable code blocks with a specific name.
     - Functions are well-suited for organizing code into logical units.
   - **Closure**:
     - Use closures for short, focused tasks.
     - Closures are great for one-time use or when passing behavior as an argument (e.g., sorting, filtering).

5. **Capture Context**:
   - **Function**:
     - Functions do not capture values from their surrounding context.
     - They operate independently.
   - **Closure**:
     - Closures capture values from their surrounding context.
     - They "remember" variables and constants even after the context changes.

6. **Function vs. Closure Example**:
   - **Function**:
     ```swift
     func add(a: Int, b: Int) -> Int {
         return a + b
     }
     let result = add(a: 3, b: 5) // Calling the function
     ```
   - **Closure**:
     ```swift
     let addClosure: (Int, Int) -> Int = { a, b in
         return a + b
     }
     let resultClosure = addClosure(3, 5) // Calling the closure
     ```

In summary, functions have names and are reusable, while closures are anonymous and capture values from their context. Both serve different purposes and can be used effectively in Swift programming. 😊


How do I prevent retain cycles with escaping closures?
What are some common pitfalls when using escaping closures?
```

```swift
1. **Given Code**:
   ```swift
   extension Int {
       subscript(digitIndex: Int) -> Int {
           var decimalBase = 1
           for _ in 0..<digitIndex {
               decimalBase *= 10
           }
           return (self / decimalBase) % 10
       }
   }
   ```

```js
Certainly! Let's calculate the values step by step:
2. **Explanation**:
   - The code defines an extension for the `Int` type, allowing you to access individual digits of an integer by their position (index).
   - The subscript takes an integer parameter called `digitIndex` and returns the digit at that index.

3. **Example Usage**:
   - Let's consider the number `746381295`.
   - We'll calculate the value of `(self / decimalBase) % 10` for different `digitIndex` values:

   a. For `digitIndex = 0`:
      - `decimalBase` remains 1 (since no iterations occur in the loop).
      - `(self / decimalBase) % 10` becomes `(746381295 / 1) % 10`.
      - The result is `5`.

   b. For `digitIndex = 1`:
      - `decimalBase` becomes 10 (after one iteration in the loop).
      - `(self / decimalBase) % 10` becomes `(746381295 / 10) % 10`.
      - The result is `9`.

   c. For `digitIndex = 2`:
      - `decimalBase` becomes 100 (after two iterations in the loop).
      - `(self / decimalBase) % 10` becomes `(746381295 / 100) % 10`.
      - The result is `2`.

   d. For `digitIndex = 8`:
      - `decimalBase` becomes 100000000 (after eight iterations in the loop).
      - `(self / decimalBase) % 10` becomes `(746381295 / 100000000) % 10`.
      - The result is `7`.

4. **Summary**:
   - The expression `(self / decimalBase) % 10` extracts the digit at the specified index from the number `746381295`.
   - The modulo operation ensures that we get the rightmost digit (the remainder after dividing by 10).

Feel free to ask if you have any more questions or need further clarification! 😊
```

```js
Certainly! Let's break down the given Swift code step by step:

1. **Extension for Int Type**:
   - The code defines an extension for the `Int` type. Extensions allow you to add new functionality to existing types (in this case, `Int`).
   - The extension adds a computed property called `kind` to `Int` values.

2. **Enum Definition**:
   - Inside the extension, there's an enum called `Kind`.
   - The `Kind` enum has three cases:
     - `.negative`: Represents negative integers.
     - `.zero`: Represents zero.
     - `.positive`: Represents positive integers.

3. **Computed Property `kind`**:
   - The `kind` property returns a value of the `Kind` enum based on the value of the integer.
   - Here's how it works:
     - If the integer is 0, it returns `.zero`.
     - If the integer is greater than 0 (where `x > 0`), it returns `.positive`.
     - Otherwise (i.e., negative integers), it returns `.negative`.

4. **Switch Statement**:
   - The switch statement inside the computed property checks the value of `self` (which is the integer being operated on).
   - It evaluates the cases in the following order:
     - If `self` is 0, it returns `.zero`.
     - If `self` is greater than 0, it returns `.positive`.
     - Otherwise (for negative integers), it returns `.negative`.

5. ``Pattern Matching with `where` Clause``
   - The `where` clause in the switch statement allows for pattern matching with conditions.
   - In this case, it checks if the value of `x` (the integer) is greater than 0.

6. **Example Usage**:
   - Suppose we have an integer value, e.g., `let number: Int = 42`.
   - We can access its `kind` using `let numberKind = number.kind`.
   - The value of `numberKind` will be `.positive` because 42 is greater than 0.

In summary, this Swift code provides a concise way to determine the kind of an integer (whether it's negative, zero, or positive) based on the value of the integer itself. The `where` clause in the switch statement allows for conditional pattern matching, making the code flexible and expressive.


## Let's break down the meaning of `var kind: Kind` in the context of the computed property called `kind`.

1. **`var kind: Kind`**:
   - This line declares a **computed property** named `kind` of type `Kind`.
   - Let's dissect it further:
     - `var`: This keyword indicates that we are defining a variable (in this case, a computed property).
     - `kind`: The name of the computed property.
     - `: Kind`: The type annotation specifying that the property's type is the `Kind` enum.

2. **Computed Property**:
   - A computed property is a special kind of property in Swift.
   - Unlike stored properties (which store a value), computed properties do not store a value directly. Instead, they compute a value on-the-fly based on other properties or data.
   - Computed properties are defined using `get` and optionally `set` blocks.

3. **`Kind` Enum**:
   - The `Kind` enum is defined within the extension for the `Int` type.
   - It has three cases: `.negative`, `.zero`, and `.positive`.
   - These cases represent different kinds of integers (negative, zero, or positive).

4. **Purpose of `kind` Computed Property**:
   - The purpose of the `kind` computed property is to determine the kind of an integer (whether it falls into one of the three categories: negative, zero, or positive).
   - When you access the `kind` property on an integer value, it computes the appropriate `Kind` enum case based on the value of the integer.

5. **Example Usage**:
   - Suppose we have an integer value, e.g., `let number: Int = 42`.
   - We can access its `kind` using `let numberKind = number.kind`.
   - The value of `numberKind` will be `.positive` because 42 is greater than 0.

In summary, the `var kind: Kind` declaration establishes a computed property that allows you to determine the kind of an integer using the `Kind` enum. The actual computation of the `kind` value occurs when you access this property for a specific integer. 😊


Note

number.kind is already known to be of type Int.Kind. Because of this, all of the Int.Kind case values can be written in shorthand form inside the switch statement, such as .negative rather than Int.Kind.negative.
```

## Initializers

Extensions can add new initializers to existing types. This enables you to extend other types to accept your own custom types as initializer parameters, or to provide additional initialization options that were not included as part of the type’s original implementation.

Extensions can add new convenience initializers to a class, but they can’t add new designated initializers or deinitializers to a class. Designated initializers and deinitializers must always be provided by the original class implementation.

If you use an extension to add an initializer to a value type that provides default values for all of its stored properties and doesn’t define any custom initializers, you can call the default initializer and memberwise initializer for that value type from within your extension’s initializer. This wouldn’t be the case if you had written the initializer as part of the value type’s original implementation, as described in Initializer Delegation for Value Types.
