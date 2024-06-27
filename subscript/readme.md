# Subscripts

Access the elements of a collection.

Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. For example, you access elements in an Array instance as `someArray[index]` and elements in a Dictionary instance as `someDictionary[key]`.

You can define multiple subscripts for a single type, and the appropriate subscript overload to use is selected based on the type of index value you pass to the subscript. Subscripts aren’t limited to a single dimension, and you can define subscripts with multiple input parameters to suit your custom type’s needs.

## Subscript Syntax

Subscripts enable you to query instances of a type by writing one or more values in square brackets after the instance name. Their syntax is similar to both instance method syntax and computed property syntax. You write subscript definitions with the subscript keyword, and specify one or more input parameters and a return type, in the same way as instance methods. Unlike instance methods, subscripts can be read-write or read-only. This behavior is communicated by a getter and setter in the same way as for computed properties:

```swift

subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
}
The type of newValue is the same as the return value of the subscript. As with computed properties, you can choose not to specify the setter’s (newValue) parameter. A default parameter called newValue is provided to your setter if you don’t provide one yourself.

As with read-only computed properties, you can simplify the declaration of a read-only subscript by removing the get keyword and its braces:
subscript(index: Int) -> Int {
    // Return an appropriate subscript value here.
}

In this example, a new instance of TimesTable is created to represent the three-times-table. This is indicated by passing a value of 3 to the structure’s initializer as the value to use for the instance’s multiplier parameter.

You can query the threeTimesTable instance by calling its subscript, as shown in the call to threeTimesTable[6]. This requests the sixth entry in the three-times-table, which returns a value of 18, or 3 times 6

Note

An n-times-table is based on a fixed mathematical rule. It isn’t appropriate to set threeTimesTable[someIndex] to a new value, and so the subscript for TimesTable is defined as a read-only subscript.

// Subscript Usage
// UserDefaults with type-safe keys
extension UserDefaults {
    struct Key<Value> {
        var name: String
    }

    subscript<T>(key: Key<T>) -> T? {
        get {
            return value(forKey: key.name) as? T
        }
        set {
            set(newValue, forKey: key.name)
        }
    }
}

// Usage:
let accessTokenKey = UserDefaults.Key<String>(name: "accessToken")
UserDefaults.standard[accessTokenKey] = "myToken"
let token = UserDefaults.standard[accessTokenKey] // Retrieves the token
// Prints "myToken"


## Subscript Options

Subscripts can take any number of input parameters, and these input parameters can be of any type. Subscripts can also return a value of any type.

Like functions, subscripts can take a varying number of parameters and provide default values for their parameters, as discussed in Variadic Parameters and Default Parameter Values. However, unlike functions, subscripts can’t use in-out parameters.


## Let's break down the Swift code step by step:

1. **Struct Definition:**
    - The code defines a `Matrix` struct.
    - The struct has three properties:
        - `rows` and `columns` (both of type `Int`) represent the dimensions of the matrix.
        - `grid` (of type `[Double]`) is an array that holds the matrix elements.
    - The `init` method initializes the struct with the specified number of rows and columns.
        - It sets the `rows` and `columns` properties.
        - It creates an array called `grid` with all elements initialized to `0.0`.

2. **Index Validation:**
    - The `indexIsValid(row:column:)` method checks whether a given row and column index is within the valid range for the matrix.
    - It returns `true` if the indices are valid (i.e., within bounds), and `false` otherwise.
    - If an invalid index is encountered, an assertion failure occurs with the message "Index out of range."

3. **Subscript Getter and Setter:**
    - The subscript (`subscript(row:column:)`) allows you to access and modify individual matrix elements.
    - The getter retrieves the value at the specified row and column.
        - It first validates the indices using the `indexIsValid` method.
        - Then it calculates the linear index in the `grid` array based on the row and column.
    - The setter assigns a new value to the specified matrix element.
        - It also validates the indices.
        - It updates the corresponding element in the `grid`.

4. **Usage Example:**
    - The code creates a `matrix` instance with 2 rows and 2 columns.
    - It sets the value at row 0, column 1 to 1.5.
    - It sets the value at row 1, column 0 to 3.2.

Here's a summary of the matrix after the operations:

Matrix:
[0.0, 1.5]
[3.2, 0.0]


The `Matrix` struct provides a convenient way to work with 2D arrays in Swift. You can create matrices, access elements, and modify them using the subscript syntax. If you have any further questions, feel free to ask! 😊¹²³

---
I've provided a detailed explanation of the Swift code, but if you'd like additional clarification or have any other queries, feel free to ask!

## create a new Matrix instance with two rows and two columns, you're essentially creating a two-dimensional array. This array is often visualized as a grid, like so

Matrix:
[ [x, x],
[x, x] ]

However, the actual storage for this matrix in memory is a one-dimensional array that holds the elements in a sequence. This is what's meant by a "flattened" version of the matrix. So, if you read the elements from the top left to the bottom right, the one-dimensional array (or the grid array) would look like this:

Flattened Matrix:
[x, x, x, x]

Here, `x` represents the value of each element in the matrix. The first two `x`'s represent the first row, and the second pair represents the second row. This flattened structure makes it easier to manage memory and access elements in the matrix, as you can calculate the index of any element based on its row and column number using a formula like:

index = (row x numberOfColumns) + column 

For a matrix with two rows and two columns, accessing the element at the second row and first column (assuming zero-based indexing) would be:

index = (1 x 2) + 0 = 2 

So in the flattened array, the element at index 2 corresponds to the element at the second row and first column of the conceptual two-dimensional matrix. This approach is common in programming languages for handling multi-dimensional data structures efficiently.
