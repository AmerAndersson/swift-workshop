
/**
** Extension of the Double type is declared.
self refers to the current value of the Double on which these computed properties are being accessed.
25.4.mm uses the mm computed property to convert 25.4 from millimeters to meters.
3.ft uses the ft computed property to convert 3 from feet to meters.
*/
extension Double {
    // Computed properties are defined to convert the Double value into different units of length.
    // Converts the value to kilometers (1 km = 1,000 meters)
    var km: Double { return self * 1_000.0 }
    // Value is already in meters, so it's returned as is.
    var m: Double { return self }
    // Converts the value to centimeters (1 m = 100 cm).
    var cm: Double { return self / 100.0 }
    // Converts the value to millimeters (1 m = 1,000 mm).
    var mm: Double { return self / 1_000.0 }
    // Converts the value to feet (1 foot = 0.3048 meters).
    var ft: Double { return self / 3.28084 }
}
// 'oneInch' is declared as a Double, initialized with the value of 25.4 millimeters converted to meters.
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
// 'threeFeet' is declared as a Double, initialized with the value of 3 feet converted to meters.
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"
// 'aMarathon' is declared as a Double, initialized with the sum of 42 kilometers and 195 meters
let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// Prints "A marathon is 42195.0 meters long"
/**
42.km converts 42 kilometers to meters using the previously defined km computed property, 
which multiplies the value by 1_000.0 to convert kilometers to meters.
195.m is already in meters, so it uses the m computed property, which returns the value as is.
These two values are then added together to get the total length of a marathon in meters.
This is because a standard marathon race is defined as 42 kilometers and 195 meters long,
which is exactly what the code calculates. The extension you’ve defined for the Double 
type makes it easy to perform these conversions and calculations directly on numeric literals
*/
print("--------------------------------------")

/**
** Initializers
below defines a custom Rect structure to represent a geometric rectangle. 
Also defines two supporting structures called Size and Point, 
both of which provide default values of 0.0 for all of their properties:
*/
// Define a structure named 'Size' with two properties: width and height.
struct Size {
    var width = 0.0, height = 0.0
}

// Define a structure named 'Point' with two properties: x and y.
struct Point {
    var x = 0.0, y = 0.0
}

// Define a structure named 'Rect' with two properties: origin and size.
// 'origin' is a Point and 'size' is a Size.
struct Rect {
    var origin = Point()
    var size = Size()
}

// Create an instance of 'Rect' using the default initializer.
// This will use the default values of Point() for origin and Size() for size.
let defaultRect = Rect()

// Create an instance of 'Rect' using a custom initializer.
// This allows setting the origin and size upon creation.
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))
print(defaultRect)
// Prints "Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 0.0, height: 0.0))"
print(memberwiseRect)
// Prints "Rect(origin: Main.Point(x: 2.0, y: 2.0), size: Main.Size(width: 5.0, height: 5.0))"
print("--------------------------------------")

// Extend the 'Rect' structure to include a new initializer.
// This initializer takes a 'center' Point and a 'size' Size.
extension Rect {
    init(center: Point, size: Size) {
        // Calculate the origin's x and y by subtracting half the size from the center.
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        // Call the existing initializer with the new origin and size.
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// Create an instance of 'Rect' using the new initializer defined in the extension.
// The 'center' is set to (4.0, 4.0) and 'size' to (width: 3.0, height: 3.0).
// The calculated origin will be (2.5, 2.5) based on the center and size.
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
print(centerRect)
// Prints "Rect(origin: Point(x: 2.5, y: 2.5), size: Size(width: 3.0, height: 3.0))"