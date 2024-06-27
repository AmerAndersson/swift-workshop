/**
* Subscripts: 
Access the elements of a collection.
Classes, structures, and enumerations can define subscripts, 
which are shortcuts for accessing the member elements of a collection, list, or sequence.
Use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. 
Access elements in an Array instance as someArray[index] and elements in a Dictionary instance as someDictionary[key].
*/

// A read-only subscript implementation, which defines a TimesTable 
// structure to represent an n-times-table of integers:
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("Three times six is \(threeTimesTable[6])")
// Prints "six times three is 18
print("----------------------------")

/**
Subscript Options
A class or structure can provide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the types of the value or values that are contained within the subscript brackets at the point that the subscript is used. This definition of multiple subscripts is known as subscript overloading.

While it’s most common for a subscript to take a single parameter, you can also define a subscript with multiple parameters if it’s appropriate for your type. The following example defines a Matrix structure, which represents a two-dimensional matrix of Double values. The Matrix structure’s subscript takes two integer parameters:

Matrix provides an initializer that takes two parameters called rows and columns, and creates an array that’s large enough to store rows * columns values of type Double. Each position in the matrix is given an initial value of 0.0. To achieve this, the array’s size, and an initial cell value of 0.0, are passed to an array initializer that creates and initializes a new array of the correct size

The Matrix subscript’s getter and setter both contain an assertion to check that the subscript’s row and column values are valid.
To assist with these assertions, Matrix includes a convenience method called indexIsValid(row:column:),
which checks whether the requested row and column are inside the bounds of the matrix:
*/
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
// A new Matrix instance by passing an appropriate row and column count to its initializer:
var matrix = Matrix(rows: 2, columns: 2)
// The code above creates a new Matrix instance with two rows and two columns.
// The grid array for this Matrix instance is effectively a flattened version of the matrix,
// as read from top left to bottom right: Matrix:
// [0.0, 1.5]
// [3.2, 0.0]

// Values in the matrix can be set 
// by passing row and column values 
// into the subscript, separated by a comma:
// These two statements call the subscript’s setter to set a value of 1.5 
// in the top right position of the matrix (where row is 0 and column is 1),
// and 3.2 in the bottom left position (where row is 1 and column is 0):


matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix)
print("Grid: \(matrix.grid)")

/**
Type Subscripts
Instance subscripts, as described above, are subscripts that you call on an instance of a particular type. You can also define subscripts that are called on the type itself. This kind of subscript is called a type subscript. You indicate a type subscript by writing the static keyword before the subscript keyword.  
This shows how you define and call a type subscript:
*/
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)