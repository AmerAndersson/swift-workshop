
// Properties: Access stored and computed values that are part of an instance or type.
// Stored Properties defines a structure called FixedLengthRange, 
// which describes a range of integers whose range length can’t be changed after it’s created:
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
print(rangeOfThreeItems.firstValue)
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8
print(rangeOfThreeItems.firstValue)

// Stored Properties of Constant Structure Instances
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
print(rangeOfFourItems.firstValue)
// rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property
print("------------------------")

// Lazy Stored Properties to avoid unnecessary initialization of a complex class. 
// This defines two classes called DataImporter and DataManager, neither of which is shown in full:
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}


class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}


let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.data )
// the DataImporter instance for the importer property hasn't yet been created
print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"

// Stored Properties and Instance Variables
// All information about the property — including its name, type,
// and memory management characteristics — is defined in a single location as part of the type’s definition.
print("------------------------")

// Computed Properties
// In addition to stored properties, classes, structures, 
// and enumerations can define computed properties, 
// which don’t actually store a value. Instead, 
// they provide a getter and an optional setter 
// to retrieve and set other properties and values indirectly.
struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
} 
// Original square
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

//  called getter for center 
let initialSquareCenter = square.center
print("initialSquareCenter is at (\(initialSquareCenter.x), \(initialSquareCenter.y))")

// Set new center and called getter for center
square.center = Point(x: 15.0, y: 15.0)

// Updated origin
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
print("------------------------")

// Shorthand Setter Declaration
// If a computed property’s setter doesn’t define a name for the new value to be set, a default name of newValue is used. 
// Here’s an alternative version of the Rect structure that takes advantage of this shorthand notation:
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
// Original square
var alternativeSquare = AlternativeRect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

//  called getter for center 
let initialSquareCenter2 = alternativeSquare.center 
print("initialSquareCenter2 is at (\(initialSquareCenter2.x), \(initialSquareCenter2.y))")

// Set new center and called getter for center
alternativeSquare.center = Point(x: 15.0, y: 15.0)

// Updated origin
print("alternativeSquare.origin is now at (\(alternativeSquare.origin.x), \(alternativeSquare.origin.y))")
print("------------------------")

// Shorthand Getter Declaration
// If the entire body of a getter is a single expression, 
// the getter implicitly returns that expression. 
// Here’s another version of the Rect structure that takes advantage
// of this shorthand notation and the shorthand notation for setters:
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
// Original square
var compactSquare = CompactRect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

// Called getter for center
let initialSquareCenter3 = compactSquare.center
print("initialSquareCenter3 is at (\(initialSquareCenter3.x), \(initialSquareCenter3.y))")

// Set new center and called getter for center
compactSquare.center = Point(x: 15.0, y: 15.0)

// Updated origin
print("compactSquare.origin is now at (\(compactSquare.origin.x), \(compactSquare.origin.y))")
print("------------------------")

// Read-Only Computed Properties
// A computed property with a getter but no setter is known as a read-only computed property. 
// A read-only computed property always returns a value, and can be accessed through dot syntax, 
// but can’t be set to a different value.
// You can simplify the declaration of a read-only computed property by removing the get keyword and its braces:

struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// struct called Cuboid, which represents a 3D rectangular box with width, height, 
// and depth properties. This structure also has a read-only computed property called volume, 
// which calculates and returns the current volume of the cuboid. It doesn’t make sense for volume to be settable,
print("------------------------")

// Property observers observe and respond to changes in a property’s value.
// Property observers are called every time a property’s value is set, 
// even if the new value is the same as the property’s current value.
// Add property observers in the following places:
// - Stored properties that you define
// - Stored properties that you inherit
// - Computed properties that you inherit
// You have the option to define either or both of these observers on a property:
// - willSet is called just before the value is stored.
// - didSet is called immediately after the new value is stored.

// class called StepCounter, which tracks the total number of steps that a person takes while walking. 
// This class might be used with input data from a pedometer or other step counter to keep track of 
// a person’s exercise during their daily routine
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
stepCounter.totalSteps = 1000
// About to set totalSteps to 1000
// Added 100 steps
stepCounter.totalSteps = 2000
// About to set totalSteps to 2000
// Added 200 steps
stepCounter.totalSteps = 3000
// About to set totalSteps to 3000
// Added 100 steps
stepCounter.totalSteps = 4000
print("------------------------")

// The property observers allow us to react to changes in the property’s value 
class ScoreKeeper {
    var score: Int = 0 {
        willSet(newScore) {
            print("About to set Score to \(newScore)")
        }
        didSet {
            if score > oldValue {
                print("Score increased by \(score - oldValue)")
            }
        }
    }
}

let gameScore = ScoreKeeper()
gameScore.score = 200
gameScore.score = 390
gameScore.score = 760
gameScore.score = 1000
print("------------------------")

// The property observers allow us to react to changes in the property’s value 
class TemperatureSensor {
    var temperature: Double = 0.0 {
        willSet(newValue){
            print("About to set Temperature to \(newValue)°C")
        }
        didSet {
            if temperature > oldValue {
                print("Temperature now is \(temperature - oldValue)°C")
          }
        }
    }
}

let sensor = TemperatureSensor()
sensor.temperature = 20.5
sensor.temperature = 25.0
sensor.temperature = 27.0
sensor.temperature = 30.0
print("------------------------")

// A property wrapper adds a layer of separation between code that
// manages how a property is stored and the code that defines a property
// The setter ensures that new values are less than or equal to 12, 
// and the getter returns the stored value.
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
// A structure that stores a rectangle that uses the TwelveOrLess property wrapper
// to ensure its dimensions are always 12 or less:

// The height and width properties get their initial values 
// from the definition of TwelveOrLess,which sets TwelveOrLess.number to zero. 
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}


var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"
// The height and width properties get their initial values from the definition of TwelveOrLess,
// which sets TwelveOrLess.number to zero. The setter in TwelveOrLess treats 10 as a valid value
// so storing the number 10 in rectangle. height proceeds as written. However, 24 is larger than 
// TwelveOrLess allows, so trying to store 24 end up setting rectangle.height to 12 instead, the largest allowed value.
// When you apply a wrapper to a property, the compiler synthesizes code that provides storage 
// for the wrapper and code that provides access to the property through the wrapper. 
// (The property wrapper is responsible for storing the wrapped value, so there’s no synthesized code for that.)
print("------------------------")

// You could write code that uses the behavior of a property wrapper, 
// without taking advantage of the special attribute syntax:
// A version of SmallRectangle from the previous code listing that wraps its properties
// in the TwelveOrLess structure explicitly, instead of writing @TwelveOrLess as an attribute:

// The _height and _width properties store an instance of the property wrapper, TwelveOrLess. 
// The getter and setter for height and width wrap access to the wrappedValue property.
struct SmallRectangles {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

var rectangles = SmallRectangles()
print(rectangles.height)
// Prints "0"

rectangles.height = 10
print(rectangles.height)
// Prints "10"

rectangles.height = 24
print(rectangles.height)
// Prints "12"
print("----------small--------------")

// To support setting an initial value or other customization, the property wrapper needs to add an initializer.
// A version of TwelveOrLess called SmallNumber that defines initializers that set the wrapped and maximum value:
// The definition of SmallNumber includes three initializers — init(), init(wrappedValue:), and init(wrappedValue:maximum:)
// — which the examples below use to set the wrapped value and the maximum value.
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}


// When you apply a wrapper to a property and you don’t specify an initial value, 
// Swift uses the init() initializer to set up the wrapper. 
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// Prints "0 0"
//The instances of SmallNumber that wrap height and width are created by calling SmallNumber(). 
// The code inside that initializer sets the initial wrapped value and the initial maximum value,
// using the default values of zero and 12. The property wrapper still provides all of the initial values
print("------------------------")

// SmallNumber also supports writing those initial values as part of declaring the property.
// When you specify an initial value for the property, Swift uses the init(wrappedValue:) initializer to set up the wrapper. 
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}


var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// Prints "1 1"
unitRectangle.height = 33
print(unitRectangle.height, unitRectangle.width )
// When you write = 1 on a property with a wrapper, that’s translated into a call to the init(wrappedValue:) initializer.
// The instances of SmallNumber that wrap height and width are created by calling SmallNumber(wrappedValue: 1). 
// The initializer uses the wrapped value that’s specified here, and it uses the default maximum value of 12.
print("------------------------")

// When you write arguments in parentheses after the custom attribute, 
// Swift uses the initializer that accepts those arguments to set up the wrapper. 
// if you provide an initial value and a maximum value, Swift uses the init(wrappedValue:maximum:) initializer:
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}


var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// Prints "2 3"

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// Prints "5 4"
/**
The instance of SmallNumber that wraps height is created by calling SmallNumber(wrappedValue: 2, maximum: 5), 
and the instance that wraps width is created by calling SmallNumber(wrappedValue: 3, maximum: 4).

By including arguments to the property wrapper, you can set up the initial state in the wrapper
or pass other options to the wrapper when it’s created. 

This syntax is the most general way to use a property wrapper. 
You can provide whatever arguments you need to the attribute, 
and they’re passed to the initializer.
*/
print("------------------------")

// When you include property wrapper arguments, you can also specify an initial value using assignment. 
// Swift treats the assignment like a wrappedValue argument and uses the initializer that accepts the arguments you include. 
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// Prints "1"

mixedRectangle.width = 20
print(mixedRectangle.width)
mixedRectangle.height = 20
print(mixedRectangle.height)
// Prints "12
// The instance of SmallNumber that wraps height is created by calling SmallNumber(wrappedValue: 1),
// which uses the default maximum value of 12. The instance that wraps width is created by calling SmallNumber(wrappedValue: 2, maximum: 9).
print("------------------------")

// Projecting a Value From a Property Wrapper
// In the SmallNumber example above, if you try to set the property to a number that’s too large,
// the property wrapper adjusts the number before storing it. 
// The code below adds a projectedValue property to the SmallNumber structure to keep track 
// of whether the property wrapper adjusted the new value for the property before storing that new value.
@propertyWrapper
struct SmallNumbers {
    private var number: Int
    private(set) var projectedValue: Bool


    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }


    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure {
    @SmallNumbers var someNumber: Int
}

var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"
// Writing someStructure.$someNumber accesses the wrapper’s projected value.
// After storing a small number like four, the value of someStructure.$someNumber is false.
// However, the projected value is true after trying to store a number that’s too large, like 55.

// A property wrapper can return a value of any type as its projected value. 
// The property wrapper exposes only one piece of information — whether the number was adjusted — so 
// it exposes that Boolean value as its projected value. 


print("------------------------")
// A wrapper that needs to expose more information can return an instance of some other type,
// or it can return self to expose the instance of the wrapper as its projected value.
// When you access a projected value from code that’s part of the type, 
// like a property getter or an instance method, you can omit self. 
// before the property name, just like accessing other properties.
// The code in the following example refers to the projected value 
// of the wrapper around height and width as $height and $width:
enum Sizes {
    case small, large
}


struct SizedRectangle {
    @SmallNumbers var height: Int
    @SmallNumbers var width: Int

    mutating func resize(to size: Sizes) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}
var sizedRectangle = SizedRectangle()
print(sizedRectangle.resize(to: .small))
print(sizedRectangle.height, sizedRectangle.width)

print(sizedRectangle.resize(to: .large))
print(sizedRectangle.height, sizedRectangle.width)
// Prints "10 20"
// Because property wrapper syntax is just syntactic sugar for a property with a getter and a setter,
// accessing height and width behaves the same as accessing any other property.
// For example, the code in resize(to:) accesses height and width using their property wrapper. 
// If you call resize(to: .large), the switch case for .large sets the rectangle’s height and width to 100.
// The wrapper prevents the value of those properties from being larger than 12, and it sets the projected 
// value to true, to record the fact that it adjusted their values. At the end of resize(to:), the return statement 
// checks $height and $width to determine whether the property wrapper adjusted either height or width.
print("------------------------")

// Global and Local Variables
// The capabilities described above for computing and observing properties are also available to global variables and local variables.
// Global variables are variables that are defined outside of any function, method, closure, 
// or type context. Local variables are variables that are defined within a function, method, or closure context.
// The global and local variables you have encountered in previous chapters have all been stored variables. 
// Stored variables, like stored properties, provide storage for a value of a certain type and allow that value to be set and retrieved.

// You can apply a property wrapper to a local stored variable,
// but not to a global variable or a computed variable.
// The myNumber uses SmallNumbers as a property wrapper.

// Like when you apply SmallNumber to a property, 
// setting the value of myNumber to 10 is valid. 
// Because the property wrapper doesn’t allow values higher than 12, it sets myNumber to 12 instead of 24.
func someFunction() {
    @SmallNumber var myNumber: Int = 0


    myNumber = 10
    print(myNumber)
    // now myNumber is 10


    myNumber = 24
    print(myNumber)
    // now myNumber is 12
}

someFunction()
// Prints "10"
print("------------------------")

// Type Properties
// Instance properties are properties that belong to an instance of a particular type. 
// Every time you create a new instance of that type, it has its own set of property values, 
// separate from any other instance. 

// Type properties are useful for defining values that are universal to all instances of a particular type,
// such as a constant property that all instances can use (like a static constant in C), 
// or a variable property that stores a value that’s global to all instances of that type (like a static variable in C).
// Stored type properties can be variables or constants. Computed type properties are always declared as variable properties,
// in the same way as computed instance properties.

// You define type properties with the static keyword. For computed type properties for class types, 
// you can use the class keyword instead to allow subclasses to override the superclass’s implementation.
// The syntax for stored and computed type properties:
struct SomeStructures {
    static var storedTypeProperty = "Some Structure Value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some Enumeration value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some Class value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
// Querying and Setting Type Properties
// Type properties are queried and set with dot syntax, just like instance properties. 
// However, type properties are queried and set on the type, not on an instance of that type
print(SomeStructures.storedTypeProperty)
// Prints "Some Structure Value."
SomeStructures.storedTypeProperty = "Another value."
print(SomeStructures.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"
// Note
// The computed type property examples above are for read-only computed type properties,
// but you can also define read-write computed type properties with the same syntax as for computed instance properties.
// Unlike stored instance properties, you must always give stored type properties a default value. 
// This is because the type itself doesn’t have an initializer that can assign a value to a stored type property at initialization time.
print("------------------------")

// The following use two stored type properties as part of a structure 
// that models an audio level meter for a number of audio channels. 
// Each channel has an integer audio level between 0 and 10 inclusive.

// The figure below illustrates how two of these audio channels can 
// be combined to model a stereo audio level meter.
// When a channel’s audio level is 0, none of the lights for that channel are lit. 
// When the audio level is 10, all of the lights for that channel are lit. In this figure, 
// the left channel has a current level of 9, and the right channel has a current level of 7:

// The audio channels described above are represented by instances of the AudioChannel structure:
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
// Use the AudioChannel structure to create two new audio channels called leftChannel and rightChannel,
// to represent the audio levels of a stereo sound system:
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

// set the currentLevel of the left channel to 7, 
// the maxInputLevelForAllChannels type property is updated to equal 7:
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// Prints "7"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "7"

// try to set the currentLevel of the right channel to 11, 
// the right channel’s currentLevel property is capped to the maximum value of 10, 
// and the maxInputLevelForAllChannels type property is updated to equal 10:
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// Prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "10"