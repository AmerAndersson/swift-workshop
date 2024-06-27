/**
* * Protocols Definition: define requirements that conforming types must implement
A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

In addition to specifying requirements that conforming types must implement, you can extend a protocol to implement some of these requirements or to implement additional functionality that conforming types can take advantage of.
*/

// Property requirements are always declared as variable properties, 
// prefixed with the var keyword. Gettable and settable properties are 
// indicated by writing ``{ get set }`` after their type declaration, 
// and gettable properties are indicated by writing ``{ get }``.
protocol GettableAndSettable {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

// Always prefix type property requirements with the static keyword when you define them in a protocol. 
// This rule pertains even though type property requirements can be prefixed with the class 
// or static keyword when implemented by a class:
protocol StaticTypeProperty {
    static var someTypeProperty: Int { get set }
}

/** 
** A protocol with a single instance property requirement
The FullyNamed protocol requires a conforming type to provide a fully qualified name. 
The protocol doesn’t specify anything else about the nature of the conforming type — it
only specifies that the type must be able to provide a full name for itself. 
The protocol states that any FullyNamed type must have a gettable instance property called fullName, which is of type String.
*/
protocol FullyNamed {
    var fullName: String { get }
}

/** 
This person defines a structure called Person, which represents a specific named person. 
It states that it adopts the FullyNamed protocol as part of the first line of its definition.

Each instance of Person has a single stored property called fullName, which is of type String. 
This matches the single requirement of the FullyNamed protocol, and means that Person has correctly conformed to the protocol.
(Swift reports an error at compile time if a protocol requirement isn’t fulfilled.)
*/
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
// john.fullName is "John Appleseed"
print("FullName: \(john.fullName)")

/**
** A more complex class, which also adopts and conforms to the FullyNamed protocol:
This class implements the fullName property requirement as a computed read-only property for a starship. Each Starship class instance stores a mandatory name and an optional prefix. The fullName property uses the prefix value if it exists, and prepends it to the beginning of name to create a full name for the starship.

This class implements the fullName property requirement as a computed read-only property for a starship.
Each Starship class instance stores a mandatory name and an optional prefix. 
The fullName property uses the prefix value if it exists, and prepends it to the beginning of name to create a full name for the starship.
*/
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName is "USS Enterprise"
print("FullName: \(ncc1701.fullName)")
print("---------------------------------------------")

/**
** Method Requirements
Protocols can require specific instance methods and type methods to be implemented by conforming types. These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but without curly braces or a method body. Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, can’t be specified for method parameters within a protocol’s definition.

** RandomNumberGenerator
This protocol, RandomNumberGenerator, requires any conforming type to have an instance method called random, which returns a Double value whenever it’s called. Although it’s not specified as part of the protocol, it’s assumed that this value will be a number from 0.0 up to (but not including) 1.0.

The RandomNumberGenerator protocol doesn’t make any assumptions about how each random number will be generated — it simply requires the generator to provide a standard way to generate a new random number.
*/

// Define a protocol with a single instance method requirement
protocol RandomNumberGenerator {
    func random() -> Double
}

// An implementation of a class that adopts and conforms to the RandomNumberGenerator protocol.
// This class implements a `pseudorandom number generator algorithm known as a linear congruential generator`:
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.3746499199817101"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"
print("And another: \(generator.random())")
// Prints "And another one: 0.6364669067215364"
print("---------------------------------------------")

/**
The code defines a protocol called Togglable, which defines a single instance method requirement called toggle. 
As its name suggests, the toggle() method is intended to toggle or invert the state of any conforming type, typically by modifying a property of that type.

The toggle() method is marked with the mutating keyword as part of the Togglable protocol definition, to indicate that the method is expected to mutate the state of a conforming instance when it’s called:

If you implement the Togglable protocol for a structure or enumeration, that structure or enumeration can conform to the protocol by providing an implementation of the toggle() method that’s also marked as mutating.
*/
protocol Togglable {
    mutating func toggle()
}

/**
The code defines an enumeration called OnOffSwitch. This enumeration toggles between two states, 
indicated by the enumeration cases on and off. The enumeration’s toggle implementation is marked as mutating,
to match the Togglable protocol’s requirements:
*/
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch is now equal to .on
print(lightSwitch)
// Prints "on"
print("---------------------------------------------")

/**
** Initializer Requirements
Protocols can require specific initializers to be implemented by conforming types.
You write these initializers as part of the protocol’s definition in exactly the same way as for normal initializers, 
but without curly braces or an initializer body:
*/
protocol SomeProtocols {
    init(someParameter: Int)
}
/**
** Class Implementations of Protocol Initializer Requirements
You can implement a protocol initializer requirement on a conforming class as either 
a designated initializer or a convenience initializer. In both cases, you must mark 
the initializer implementation with the ``required modifier``:

The use of the required modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.

** Note
You don’t need to mark protocol initializer implementations with the required modifier on classes that are marked with the final modifier, because final classes can’t subclassed. For more about the final modifier, see Preventing Overrides.
*/
class SomeClass: SomeProtocols {
    required init(someParameter: Int) {
         // initializer implementation goes here
    }
}
// If a subclass overrides a designated initializer from a superclass, and also implements a matching initializer requirement from a protocol, mark the initializer implementation with both the required and override modifiers:

protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}
class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}
