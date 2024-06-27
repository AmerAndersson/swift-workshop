// Structures and Classes, Model custom types that encapsulate data.
// Structures and classes are general-purpose, flexible constructs that
// become the building blocks of your program’s code. 
// You define properties and methods to add functionality to your structures 
// and classes using the same syntax you use to define constants, variables, and functions.
// Use Structures When You Don’t Control Identity

// Use structures when you’re modeling data that contains information 
// about an entity with an identity that you don’t control.
// In an app that consults a remote database, for example, 
// an instance’s identity may be fully owned by an external entity and communicated by an identifier.
// If the consistency of an app’s models is stored on a server, you can model records as structures with identifiers. 
// jsonResponse contains an encoded PenPalRecord instance from a server:

// A structure definition and a class definition:
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Creating instances structures and classes:
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing Properties
print("The width of someResolution is \(someResolution.width)")

// Subproperties, such as the width and height property in the resolution property of a VideoMode
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// Assign a new value to a variable property:
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
print("---------------------------------")

//  Memberwise Initializers for Structure
let vga = Resolution(width: 640, height: 480)
// Consider this the Resolution structure.
// Full HD video (1920 pixels wide by 1080 pixels high).
let hd = Resolution(width: 1920, height: 1080)

// This new copy is assigned to cinema
var cinema = hd
print("cinema is now \(cinema.width) pixels wide")
print("cinema is now \(cinema.height) pixels wide")
print("---------------------------------")

// cinema projection (2048 pixels wide and 1080 pixels high):
cinema.width = 2048
cinema.height = 1080

// Checking the width property of cinema shows that it has indeed changed to be 2048:
print("cinema is now \(cinema.width) pixels wide")
print("cinema is now \(cinema.height) pixels wide")
print("---------------------------------")

// The width property of the original hd 
// instance still has the old value of (1920 pixels wide by 1080 pixels high)
print("hd is still \(hd.width) pixels wide")
print("hd is still \(hd.height) pixels wide")
// Prints "hd is still 1920 pixels wide"
print("---------------------------------")

// The same behavior applies to enumerations:
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
// copy of that value
let rememberedDirection = currentDirection
currentDirection.turnNorth()


print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")
print("---------------------------------")

// Classes Are Reference Types
// Common use cases of classes  are file handles, network connections,
// and shared hardware intermediaries like CBCentralManager.

// The VideoMode class defined above
let tenEighty = VideoMode()
// The video mode is assigned a copy of the HD
// resolution of 1920 by 1080 from before
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
// print all property of tenEighty 
print("The width of tenEighty is now \(tenEighty.resolution.width)")
print("The height of tenEighty is now \(tenEighty.resolution.height)")
print("The interlaced property of tenEighty is now \(tenEighty.interlaced)")
print("The name of tenEighty is now \(tenEighty.name!)")
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
print("---------------------------------")

// tenEighty is assigned to a new constant, called alsoTenEighty, 
// and the frame rate of alsoTenEighty is modified:
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

// Checking the frameRate property of tenEighty shows that 
// it correctly reports the new frame rate of 30.0 from the underlying VideoMode instance:
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

// Identity Operators, check whether two constants 
// or variables refer to the same single instance:
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
 } else {
   print("tenEighty and alsoTenEighty do not refer to the same VideoMode instance.")
}

if tenEighty !== alsoTenEighty {
   print("tenEighty and alsoTenEighty do not refer to the same VideoMode instance.")
} else {
   print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}