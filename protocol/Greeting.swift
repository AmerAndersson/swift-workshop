// Greet protocol
protocol Greet {
    // Blueprint of a property
    var name: String { get }
    
    // Blueprint of a method
    func message()
}

class Employee: Greet {
    // Implementation of the property
    var name = "Perry"

    // Implementation of the method
    func message() {
        print("Good Morning!")
    }
}

// usage
var employee1 = Employee()
print("\(employee1.name)")
employee1.message() // Output: Good Morning!



// Property Requirements
protocol FirstProtocol {
    // Property Requirements
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

// property requirements 
protocol AnotherProtocol {
      static var someTypeProperty: Int { get set }
}

// Multiple protocols can be listed, and are separated by commas:
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

// If a class has a superclass, list the superclass name before any 
// protocols it adopts, followed by a comma:
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}

// a protocol with multiple instance property requirements
protocol FullNameable {
    var firstName: String { get }
    var lastName: String { get }
}

struct Student: FullNameable {
    var firstName: String
    var lastName: String
}
let student = Student(firstName: "John", lastName: "Smith")
// johnAppleseed.firstName is "John"
print("\(student.firstName) \(student.lastName)")

// Method Requirements static keyword
protocol SomeProtocol {
    static func someTypeMethod()
}