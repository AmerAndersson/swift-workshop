/// Enumerations
/// Model custom types that define a list of possible values
/// Four main points of a compass:
/// (such as north, south, east, and west) 
enum CompassPoint {
    case north
    case south
    case east
    case west
}
/// directionToHead is declared as a CompassPoint
var directionToHead = CompassPoint.west

// Matching individual enumeration values with a Switch Statement:
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}/// Prints "Watch out for penguins"
print("-------------------------------")

/// Iterating over enumeration cases with CaseIterable: 
/// A collection of all the cases as an allCases property of the enumeration type:
enum Beverage: CaseIterable {
   case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count 
print("\(numberOfChoices) beverages available")
/// Prints "3 beverages available"

/// iterate over all the cases
for beverage in Beverage.allCases {
  print(beverage)
   
}
print("-------------------------------")

/// An inventory tracking system to store UPC barcodes as a tuple of four integers, 
/// UPC -> with an associated value of type (Int, Int, Int, Int)
/// QR -> code barcodes as a string of any length.
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
/// creates productBarcode and assigns it a value of Barcode.upc 
/// with an associated tuple value of (8, 85909, 51226, 3)
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
/// assign the same product a different type of barcode
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

/// The associated values are extracted as part of the switch statement. 
/// Extract each associated value as a constant (with the let prefix) 
/// Or as a variable (with the var prefix) for use within the switch case’s body:
///Place a single let or var annotation before the case name:
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
/// Prints "QR code: ABCDEFGHIJKLMNOP."

print("------------Raw values-------------------")
/// As an alternative to associated values, enumeration cases 
/// can come prepopulated with default values (called raw values), which are all of the same type.
/// Raw values, which are all of the same type.
/// that stores raw ASCII values alongside named enumeration cases:
/// the raw values for an enumeration called ASCIIControlCharacter are defined to be of type Character,
/// and are set to some of the more common ASCII control characters.
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
/// Prints "  ", Prints "\n", Prints "\r"
print("\(ASCIIControlCharacter.tab.rawValue)")
print("\(ASCIIControlCharacter.lineFeed.rawValue)")
print("\(ASCIIControlCharacter.carriageReturn.rawValue)")
print("------------Raw values-------------------")

/// Implicitly Assigned Raw Values and automatically assigns the values
/// Raw values to represent each planet’s order from the sun:
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/// Planet.mercury has an explicit raw value of 1, 
/// Planet.venus has an implicit raw value of 2, and so on.

/// access the raw value of an enumeration case with its rawValue property:
let mercuryPlanet = Planet.mercury.rawValue
let earthsOrder = Planet.earth.rawValue
/// mercuryPlanet is equal to 1, and earthsOrder is equal to 3.

print("Mercury is number \(mercuryPlanet) in the solar system.")
print("Earth is number \(earthsOrder) in the solar system.")
print("-------------------------------")


/// When strings are used for raw values, 
/// the implicit value for each case is the text of that case’s name.
/// With string raw values to represent each direction’s name.
/// CompassPoints.west has an implicit raw value of "west", and so on.
enum CompassPoints: String {
    case north, south, east, west
}

///access the raw value of an enumeration case with its rawValue property:
let sunsetDirection = CompassPoints.west.rawValue
print("The sun will set at \(sunsetDirection).")
// sunsetDirection is "west"

/// Initializing from a Raw Value
/// If you define an enumeration with a raw-value type, 
/// the enumeration automatically receives an initializer that takes 
/// a value of the raw value’s type (as a parameter called rawValue)
/// and returns either an enumeration case or nil. 
/// You can use this initializer to try to create a new instance of the enumeration.
/// This identifies Uranus from its raw value of 7:

/// possiblePlanet is of type Planet?, and equals Planet.uranus.
/// creates an optional Planet,and sets somePlanet to the value of that optional Planet if it can be retrieved. 
/// If it isn’t possible to retrieve a planet with a position of 7, and so the else branch is executed instead

//try to find a planet with a position of 7 with switch case
if let possiblePlanet = Planet(rawValue: 7) {
   switch possiblePlanet {
   case.uranus:
       print("Uranus is a planet with a position of 7")
   default:
       print("Not a safe place for humans")
}
} else {
    print("There isn't a planet with a position of 7")
}
// Prints "There isn't a planet with a position of 7"
// possiblePlanet is of type Planet? and equals Planet.uranus


/// If you try to find a planet with a position of 11, 
/// the optional Planet value returned by the raw value initializer will be nil:
/// uses optional binding to try to access a planet with a raw value of 11. 
/// The statement if let somePlanet = Planet(rawValue: 11) creates an optional Planet, 
/// and sets somePlanet to the value of that optional Planet if it can be retrieved. 
/// In this case, it isn’t possible to retrieve a planet with a position of 11, 
/// and so the else branch is executed instead.
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"
print("-------------------------------")

