/**
* Methods 
* Define and call functions that are part of an instance or type.
* Methods are functions that are associated with a particular type. 
* Classes, structures, and enumerations can all define instance methods, 
* which encapsulate specific tasks and functionality for working with an instance of a given type.
* Classes, structures, and enumerations can also define type methods, which are associated with the type itself.
*/

/**
* Instance Methods
* Instance methods are functions that belong to instances of a particular class, structure,
* or enumeration. They support the functionality of those instances, either by providing ways 
* to access and modify instance properties, or by providing functionality related to the instance’s purpose.
* Instance methods have exactly the same syntax as functions, as described in Functions.
*/
  
// Instance Properties of class Person (name, age)
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
// Access instance properties 
let person = Person(name: "Alice", age: 30)
print("Name: \(person.name), Age: \(person.age)") // Prints "Alice, 30"

// Instance Methods for Enumerations:
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune

    func description() -> String {
        switch self {
            case .mercury: return "Small and rocky"
            case .venus: return "Hot and cloudy"
            case .earth: return "Blue and green"
            case .mars: return "Red and white"
            case .jupiter: return "Black and white"
            case .saturn: return "Bright and blue"
            case .uranus: return "White and green"
            case .neptune: return "White and blue"
        }
    }
}
// Access call instance methods
let myPlanet = Planet.earth
print(myPlanet.description()) // Prints "Blue and green"


// Defines a simple Counter class, which can be used 
// to count the number of times an action occurs:
// The Counter class defines three instance methods:
// increment() increments the counter by 1.
// increment(by: Int) increments the counter by a specified integer amount.
// reset() resets the counter to zero. The Counter class also declares a variable property,
// count, to keep track of the current counter value.
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
// call instance methods with the same dot syntax as properties:
let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
print(counter.count)

counter.increment(by: 5)
// the counter's value is now 6
print(counter.count)

counter.reset()
// the counter's value is now 0
// print out value
print(counter.count)

// The self Property 
// Every instance of a type has an implicit property called self,
// which is exactly equivalent to the instance itself. 
// You use the self property to refer to the current instance within its own instance methods.
// The increment() method in the example above could have been written like this:

// Here, self disambiguates between a method parameter called x
// and an instance property that’s also called x:
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
} else {
   print("This point is not to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"
// Without the self prefix, Swift would assume that both uses of x referred to the method parameter called x.
print("-------------------------------------")

// Modifying Value Types from Within Instance Methods
// Opt in to this behavior by placing the mutating keyword before the func keyword for that method:
struct Points {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoints = Points(x: 1.0, y: 1.0)
somePoints.moveBy(x: 2.0, y: 3.0)
print("The point is now at (x: \(somePoints.x), y: \(somePoints.y))")
// Prints "The point is now at (3.0, 4.0)

// Assigning to self Within a Mutating Method 
// Mutating methods can assign an entirely new instance to the implicit self property.
// The Point shown above could have been written in the following way instead:

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("The point is now at (x: \(somePoint2.x), y: \(somePoint2.y))")
// Prints "The point is now at (3.0, 4.0)
// This version of the mutating moveBy(x:y:) method creates a new structure
// whose x and y values are set to the target location. 
// The end result of calling this alternative version of the method 
// will be exactly the same as for calling the earlier version.
print("-------------------------------------")

// Mutating methods for enumerations can set 
// the implicit self parameter to be a different case from the same enumeration:
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
print("The oven light is now \(ovenLight)")

ovenLight.next()
// ovenLight is now equal to .off
print("The oven light is now \(ovenLight)")

ovenLight.next()
// ovenLight is now equal to .low
print("The oven light is now \(ovenLight)")

// Defines an enumeration for a three-state switch. 
// The switch cycles between three different power states (off, low and high)
// every time its next() method is called.
print("-------------------------------------")

// * Type Method
// Instance methods, as described above, are methods that you call on an instance of a particular type.
// You can also define methods that are called on the type itself.These kinds of methods are called type methods. 
// You indicate type methods by writing the static keyword before the method’s func keyword.
// Classes can use the class keyword instead, to allow subclasses to override the superclass’s 
// implementation of that method.

// Type methods are called with dot syntax, like instance methods. 
// Here’s how call a type method on a class called SomeClasses:
class SomeClasses {
    class func someTypeMethod() {
        // type method implementation goes here
         print("Type method implementation goes here")
    }
}
SomeClasses.someTypeMethod()

/**
Define a structure called LevelTracker, which tracks a player’s progress through the different levels or stages of a game. It’s a single-player game, but can store information for multiple players on a single device.

All of the game’s levels (apart from level one) are locked when the game is first played. Every time a player finishes a level, that level is unlocked for all players on the device. The LevelTracker structure uses type properties and methods to keep track of which levels of the game have been unlocked. It also tracks the current level for an individual player.
*/
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1


    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }


    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }


    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

// The LevelTracker structure is used with the Player class, 
// to track and update the progress of an individual player:

class Player {
    var tracker = LevelTracker()
    var playerName: [String] = []
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: [String]) {
        playerName = name
    }
}

// The Player class creates a new instance of LevelTracker
// to track that player’s progress. It also provides a method called complete(level:), 
// which is called whenever a player completes a particular level. 
// This method unlocks the next level for all players and updates the player’s progress to move them to the next level. 
// (The Boolean return value of advance(to:) is ignored, because the level is known to have been unlocked 
// by the call to LevelTracker.unlock(_:) on the previous line.)

// Create an instance of the Player class for a new player, 
// and see what happens when the player completes level one:
var player = Player(name: ["John Smith", "Adam Doe"])
player.complete(level: 1)
print("\(player.playerName[0]) has highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// Prints "John Smith has highest unlocked level is now 2"

// Create a second player, whom you try to move to a level that’s 
// not yet unlocked by any player in the game,
// the attempt to set the player’s current level fails:
player = Player(name: ["Bob"])
if player.tracker.advance(to: 6) {
    print("\(player.playerName[0]) is now on level 6")
} else {
    print("level 6 hasn't yet been unlocked")
}
// Prints "level 6 hasn't yet been unlocked"