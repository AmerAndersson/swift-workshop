/** 
* Objects and Classes
* Use class followed by the class’s name to create a class. 
* A property declaration in a class is written the same way as a constant or variable declaration, 
* except that it’s in the context of a class. Likewise, method and function declarations are written the same way.
*/

class Shape {
    var numberOfSides: Int = 7
    var name: String

    init(name: String) {
        self.name = name
        numberOfSides = 7
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }

    deinit {
        // Cleanup code to be executed before the object is deallocated
        print("Shape instance named '\(name)' is being deinitialized.")
        // Add any other cleanup tasks you need
    }
}

// Example usage:
var myShape: Shape? = Shape(name: "Triangle")
print(myShape?.simpleDescription() ?? "Unknown shape")
myShape = nil // Deallocates the object, invoking the deinitializer
print() 

/** 
* Inheritance
* A class can inherit from another class. 
*/
class NamedShape {
    var numberOfSides: Int = 0
    var name: String


    init(name: String) {
       self.name = name
    }


    func simpleDescription() -> String {
       return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        // Set properties in the subclass first
        self.sideLength = sideLength
        // Call the superclass initializer
        super.init(name: name)
        // Complete any remaining initialization
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

// Create an instance of a class
let test = Square(sideLength: 5.2, name: "my test square")
print(test.simpleDescription())
print("My square area \(test.area())")


class Circle: NamedShape {
    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 5
    }

    // Calculate the area of the circle
    func area() -> Double {
        return Double.pi * radius * radius
    }

    // Provide a simple description
    override func simpleDescription() -> String {
        return "This is a circle with radius \(radius)."
    }
}

// Example usage:
let myCircle = Circle(radius: 5.0, name: "My Circle")
print(myCircle.simpleDescription())
print("Area:", myCircle.area())
print("----------------------------------") 

// In addition to simple properties that are stored, properties can have a getter and a setter.
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0


    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }


    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }


    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 18
print(triangle.sideLength)
// Prints "3.3000000000000003"
print(triangle.simpleDescription())
// Prints "3.3000000000000003"
print("----------------------------------") 

/**
If you don’t need to compute the property but still need to provide code that’s run before and after setting a new value, 
use willSet and didSet. The code you provide is run any time the value changes outside of an initializer. 
For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.
*/
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"

/**
When working with optional values, you can write ? before operations like methods, properties,
and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil.
Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. 
In both cases, the value of the whole expression is an optional value.
*/


let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
print(sideLength!)