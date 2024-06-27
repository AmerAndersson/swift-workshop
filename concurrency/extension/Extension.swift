/**
* * Add functionality to an existing type
Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you don’t have access to the original source code (known as retroactive modeling). 
Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions don’t have names.)
An extension can extend an existing type to make it adopt one or more protocols. 
To add protocol conformance, you write the protocol names the same way as you write them for a class or structure

Extensions in Swift can:

- Add computed instance properties and computed type properties
- Define instance methods and type methods
- Provide new initializers
- Define subscripts
- Define and use new nested types
- Make an existing type conform to a protocol

In Swift, you can even extend a protocol to provide implementations of its requirements or add additional functionality that conforming types can take advantage of. For more details, see Protocol Extensions.

** Note
Extensions can add new functionality to a type, but they can’t override existing functionality.

** Note
If you define an extension to add new functionality to an existing type, the new functionality will be available on all existing instances of that type, even if they were created before the extension was defined.
*/

/**
** Computed Properties
Extensions can add computed instance properties and computed type properties to existing types.
This example adds five computed instance properties to Swift’s built-in Double type, to provide basic support for working with distance units:

These computed properties express that a Double value should be considered as a certain unit of length. Although they’re implemented as computed properties, the names of these properties can be appended to a floating-point literal value with dot syntax, as a way to use that literal value to perform distance conversions.

In this example, a Double value of 1.0 is considered to represent “one meter”. This is why the m computed property returns self — the expression 1.m is considered to calculate a Double value of 1.0.

Other units require some conversion to be expressed as a value measured in meters. One kilometer is the same as 1,000 meters, so the km computed property multiplies the value by 1_000.00 to convert into a number expressed in meters. Similarly, there are 3.28084 feet in a meter, and so the ft computed property divides the underlying Double value by 3.28084, to convert it from feet to meters.

These properties are read-only computed properties, and so they’re expressed without the get keyword, for brevity. Their return value is of type Double, and can be used within mathematical calculations wherever a Double is accepted:

** Note
Extensions can add new computed properties, but they can’t add stored properties, or add property observers to existing properties.
*/
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// Prints "A marathon is 42195.0 meters long"
print("----------------------------")

/**
If you use an extension to add an initializer to a structure that was declared in another module, the new initializer can’t access self until it calls an initializer from the defining module.

This code defines a custom Rect structure to represent a geometric rectangle. It also defines two supporting structures called Size and Point, both of which provide default values of 0.0 for all of their properties:

Because the Rect structure provides default values for all of its properties, it receives a default initializer and a memberwise initializer automatically, as described in Default Initializers. 
*/
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

// create new Rect instances:
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
print("\(defaultRect.origin), \(defaultRect.size)")
print("\(memberwiseRect.origin), \(memberwiseRect.size)")


// Extend the Rect structure to provide an additional initializer that takes a specific center point and size:
// This new initializer starts by calculating an appropriate origin point based on the provided center point and size value. 
// The initializer then calls the structure’s automatic memberwise initializer init(origin:size:), 
// which stores the new origin and size values in the appropriate properties:
// ** Note
// If you provide a new initializer with an extension, 
// you are still responsible for making sure that each instance is fully initialized once the initializer completes.
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
// create new Rect instances:
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
print("\(centerRect.origin), \(centerRect.size)")
print("----------------------------")


// Methods 
// Extensions can add new instance methods and type methods to existing types.
// The following example adds a new instance method called repetitions to the Int type:
// The repetitions(task:) method takes a single argument of type () -> Void, 
// which indicates a function that has no parameters and doesn’t return a value.
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
// call the repetitions(task:) method on 
// any integer to perform a task that many number of times:
3.repetitions {print("Hello!")}
// Hello!
// Hello!
// Hello!
let five = 5
five.repetitions { print("Hello World!") }
print("----------------------------")

// ** Mutating Instance Methods
// Instance methods added with an extension can also modify (or mutate) the instance itself.
// Structure and enumeration methods that modify self or its properties must mark the instance 
// method as mutating, just like mutating methods from an original implementation.
// The code below adds a new mutating method called square to Swift’s Int type, which squares the original value:
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
print("Square of 3 x 3 is  \(someInt)")
// someInt is now 9
print("----------------------------")



/**
** Subscript
* Extensions can add new subscripts to an existing type. 
* Adds an integer subscript to Swift’s built-in Int type. 
* This subscript [n] returns the decimal digit n places in from the right of the number:
* 
* 123456789[0] returns 9
* 123456789[1] returns 8
*/
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print("Value5: \(746381295[0])")// returns 5
print("Value9: \(746381295[1])")// returns 9
print("Value2: \(746381295[2])")// returns 2 
print("Value1: \(746381295[3])") // returns 1
print("Value8: \(746381295[4])") // returns 8
print("Value3: \(746381295[5])") // returns 3
print("Value6: \(746381295[6])") // returns 6
print("Value4: \(746381295[7])") // returns 4
print("Value7: \(746381295[8])") // returns 7

// If the Int value doesn’t have enough digits for the requested index, 
// the subscript implementation returns 0, as if the number had been padded with zeros to the left:
print("Value0: \(746381295[9])")
// returns 0, as if you had requested:
print("Value0: \(0746381295[9])")
print("----------------------------")

/**
* * Nested Types
* Extensions can add new nested types to existing classes, structures, and enumerations:
* This code adds a new nested enumeration to Int. This enumeration, called Kind, 
* expresses the kind of number that a particular integer represents. 
* Specifically, it expresses whether the number is negative, zero, or positive.
* This code also adds a new computed instance property to Int, called kind, 
* which returns the appropriate Kind enumeration case for that integer.

* The `kind` property returns a value of the `Kind` enum based on the value of the integer.
* - If the integer is 0, it returns `.zero`.
* - If the integer is greater than 0 (where `x > 0`), it returns `.positive`.
* - Otherwise (i.e., negative integers), it returns `.negative`.
* 
* * Switch Statement:
*   - The switch statement inside the computed property checks the value of `self` (which is the integer being operated on).
*   - It evaluates the cases in the following order:
*   - If `self` is 0, it returns `.zero`.
*   - If `self` is greater than 0, it returns `.positive`.
*   - Otherwise (for negative integers), it returns `.negative`.
* 
* ``Pattern Matching with `where` Clause``
*   - The `where` clause in the switch statement allows for pattern matching with conditions.
*   - In this case, it checks if the value of `x` (the integer) is greater than 0.
* 
* * Example Usage**:
*   - Suppose we have an integer value, e.g., `let number: Int = 42`.
*   - We can access its `kind` using `let numberKind = number.kind`.
*   - The value of `numberKind` will be `.positive` because 42 is greater than 0
*/
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

///The nested enumeration can now be used with any Int value:
func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("+ ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// Prints "+ + - 0 - 0 + "

/**
This function, printIntegerKinds(_:), takes an input array of Int values and iterates over those values in turn. 
For each integer in the array, the function considers the kind computed property for that integer, and prints an appropriate description.

** Note
number.kind is already known to be of type Int.Kind. 
Because of this, all of the Int.Kind case values can be written in shorthand form inside the switch statement, 
such as .negative rather than Int.Kind.negative.
*/