// a protocol with a single instance property requirement
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
// john.fullName is "John Appleseed"
print("\(john.fullName)")

// This class implements the fullName property requirement 
// as a computed read-only property for a starship.
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
print("\(ncc1701.fullName)")
print("---------------------------")


// RandomNumberGenerator protocol
protocol RandomNumberGenerator {
    // Method Requirements
    func random() -> Double
}
// implementation of a class that adopts and conforms to the RandomNumberGenerator protocol.
// This class implements a pseudorandom number generator algorithm known as a linear congruential generator:
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
print("---------------------------")

// Mutating Method Requirements
// The toggle() method is marked with the mutating keyword
protocol Togglable {
  // Mutating Method Requirements
    mutating func toggle()
}

// implementation of the toggle() method 
// that’s also marked as mutating.
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
print("LightSwitch is now  \(lightSwitch)")
// Prints "on"
print("---------------------------")

// Initializer Requirements
protocol SomeProtocol {
    init(someParameter: Int)
}

// Class Implementations of Protocol Initializer Requirements
// The use of the required modifier ensures that you provide an explicit or
// inherited implementation of the initializer requirement on all subclasses of the conforming class, 
// such that they also conform to the protocol.
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}


