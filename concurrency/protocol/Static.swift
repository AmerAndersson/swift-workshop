/**
Prefix:
When defining type property requirements within a protocol, it is recommended to always prefix them with the static keyword.
*/
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

/**
The reason for this recommendation is to differentiate between type properties and instance properties. Without the static keyword, you would inadvertently declare an instance property instead of a type property1.
Static Members:
The static keyword is used to define type-level properties and methods.
Type properties are associated with the type itself, rather than any specific instance of that type.
Type methods can be called on the type itself, not on instances.
*/
struct School {
    static var studentCount = 1000
    static func getSchoolName() -> String {
        return "Swift High School"
    }
}
let schoolName = School.getSchoolName()
let totalStudents = School.studentCount

/**
In this example, studentCount and getSchoolName() are static members of the School type2.
Remember that named types (such as classes, structures, enumerations, and protocols) can have both instance properties and type properties. The static keyword helps you clearly define and access these type-level members
*/

/**
What Are Type Properties?
Type properties are properties that belong to the type itself, rather than any specific instance of that type.
They are shared across all instances of the type.
You can think of them as class-level properties or static properties.
Type properties are useful for storing values or maintaining state at the type level.
Declaring Type Properties:
You can declare type properties using the static keyword or the class keyword (for classes only).
The static keyword is more common and can be used with classes, structures, and enumerations.
*/
struct MathConstants {
    static let pi = 3.14159
    static var e = 2.71828
}
let circleArea = MathConstants.pi * radius * radius
/**
In this example, pi and e are type properties of the MathConstants struct.
Accessing Type Properties:
To access a type property, use the type name followed by the property name.
*/

/**
You can also define computed type properties.
These properties are computed rather than stored
*/
struct Circle {
    static var radius: Double = 5.0
    static var circumference: Double {
        return 2 * pi * radius
    }
}
let circumference = Circle.circumference

/**
Similar to type properties, you can define type methods using the static keyword.
Type methods are called on the type itself, not on instances.
*/
class Logger {
    static func log(message: String) {
        print("Log: \(message)")
    }
}
Logger.log(message: "Application started")

/**
Inheritance and Overriding
Subclasses can override type properties and type methods.
Use the class keyword instead of static to allow method overriding.
*/
class Animal {
    class var sound: String {
        return "Generic animal sound"
    }
}
class Dog: Animal {
    override class var sound: String {
        return "Woof!"
    }
}

/**
Instance Properties:
Instance properties are associated with a specific instance of a class, structure, or enumeration.
They store values that are unique to each instance.
*/
// Example 1: Instance properties in a class
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person1 = Person(name: "Alice", age: 30)
print("Name: \(person1.name), Age: \(person1.age)")

// Example 2: Instance properties in a structure
struct Point {
    var x: Double
    var y: Double
}

let origin = Point(x: 0.0, y: 0.0)
print("Origin: x = \(origin.x), y = \(origin.y)")

/**
Type properties belong to the type itself, not to any specific instance.
They are shared across all instances of the type.
*/
// Example 1: Type properties in a struct
struct MathConstants {
    static let pi = 3.14159
    static var e = 2.71828
}

print("Value of pi: \(MathConstants.pi)")
print("Value of e: \(MathConstants.e)")

// Example 2: Type properties in an enum
enum Direction {
    case north, south, east, west
    static let allDirections: [Direction] = [.north, .south, .east, .west]
}

print("All directions: \(Direction.allDirections)")

/**
Lazy Stored Properties:
You can also create lazy stored properties that are initialized only when accessed for the first time.
Useful for expensive computations or deferred initialization.
*/
class ImageLoader {
    lazy var image: UIImage = {
        // Load image from disk or network
        return UIImage(named: "sampleImage") ?? UIImage()
    }()
}

let loader = ImageLoader()
print("Image loaded: \(loader.image)")
