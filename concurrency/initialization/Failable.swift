/**
Failable Initializers: placing a question mark after the init keyword (init?).
The code below defines a structure called Animal, with a constant String property called species. 
The Animal structure also defines a failable initializer with a single parameter called species. 
This initializer checks if the species value passed to the initializer is an empty string. 
If an empty string is found, an initialization failure is triggered. 
Otherwise, the species property’s value is set, and initialization succeed
*/
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
// use this failable initializer to try to initialize a 
// new Animal instance and to check if initialization succeeded:
let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// Prints "An animal was initialized with a species of Giraffe

// If you pass an empty string value to the failable initializer’s species parameter,
// the initializer triggers an initialization failure:
let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature couldn't be initialized")
}
// Prints "The anonymous creature couldn't be initialized"
print("------------------------------------")


/**
Failable Initializers for Enumerations
Use a failable initializer to select an appropriate enumeration case based on one or more parameters.
The initializer can then fail if the provided parameters don’t match an appropriate enumeration case.

Define an enumeration called TemperatureUnit, with three possible states (kelvin, celsius, and fahrenheit).
A failable initializer is used to find an appropriate enumeration case for a Character value representing a temperature symbol:
*/
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
// Use this failable initializer to choose an appropriate enumeration case
// for the three possible states and to cause initialization to fail 
// if the parameter doesn’t match one of these states:
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// Prints "This is a defined temperature unit, so initialization succeeded."


let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}
// Prints "This isn't a defined temperature unit, so initialization failed.
print("------------------------------------")

/**
Failable Initializers for Enumerations with Raw Values
Enumerations with raw values automatically receive a failable initializer, init?(rawValue:), that takes a parameter called rawValue of the appropriate raw-value type and selects a matching enumeration case if one is found, or triggers an initialization failure if no matching value exists.

The TemperatureUnit example from above to use raw values of type Character and to take advantage of the init?(rawValue:) initializer:
*/
enum TemperatureUnits: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}


let fahrenheitUnits = TemperatureUnits(rawValue: "F")
if fahrenheitUnits != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// Prints "This is a defined temperature unit, so initialization succeeded."


let unknownUnits = TemperatureUnits(rawValue: "X")
if unknownUnits == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}
// Prints "This isn't a defined temperature unit, so initialization failed.
print("------------------------------------")

/**
Propagation of Initialization Failure
A failable initializer of a class, structure, or enumeration can delegate across to another failable initializer from the same class, structure, or enumeration. Similarly, a subclass failable initializer can delegate up to a superclass failable initializer.

In either case, if you delegate to another initializer that causes initialization to fail, the entire initialization process fails immediately, and no further initialization code is executed.

Propagation of Initialization Failure
Defines a subclass of Product called CartItem. 
The CartItem class models an item in an online shopping cart. 
CartItem introduces a stored constant property called quantity 
and ensures that this property always has a value of at least 1:

The failable initializer for CartItem starts by validating that 
it has received a quantity value of 1 or more. If the quantity is invalid, 
the entire initialization process fails immediately and no further initialization code is executed. 
Likewise, the failable initializer for Product checks the name value, and the initializer process fails immediately 
if name is the empty string
*/
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}


class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

// If you create a CartItem instance with a nonempty name
// and a quantity of 1 or more, initialization succeeds:
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// Prints "Item: sock, quantity: 2"

// try to create a CartItem instance with a quantity value of 0, 
// the CartItem initializer causes initialization to fail:
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
// Prints "Unable to initialize zero shirts"

// try to create a CartItem instance with an empty name value, 
// the superclass Product initializer causes initialization to fail:
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}
// Prints "Unable to initialize one unnamed product"
print("------------------------------------")

/**
** Overriding a Failable Initializer
The init! Failable Initializer
You can delegate from init? to init! and vice versa, and you can override init? with init! and vice versa. You can also delegate from init to init!, although doing so will trigger an assertion if the init! initializer causes initialization to fail.

Define a class called Document. This class models a document that can be initialized 
with a name property that’s either a nonempty string value or nil, but can’t be an empty string:
*/
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init!(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

/**
defines a subclass of Document called AutomaticallyNamedDocument. The AutomaticallyNamedDocument subclass overrides both of the designated initializers introduced by Document. These overrides ensure that an AutomaticallyNamedDocument instance has an initial name value of "[Untitled]" if the instance is initialized without a name, or if an empty string is passed to the init(name:) initializer:
*/
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

/**
You can use forced unwrapping in an initializer to call a failable initializer from the superclass as part of the implementation of a subclass’s nonfailable initializer. For example, the UntitledDocument subclass below is always named "[Untitled]", and it uses the failable init(name:) initializer from its superclass during initialization.
*/
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}
// instance
let untitledDocument = UntitledDocument()
print(untitledDocument.name ?? "Unnamed")
// Prints "[Untitled]"
print("------------------------------------")

/**
Setting a Default Property Value with a Closure or Function

If a stored property’s default value requires some customization or setup, you can use a closure or global function to provide a customized default value for that property. Whenever a new instance of the type that the property belongs to is initialized, the closure or function is called, and its return value is assigned as the property’s default value.

These kinds of closures or functions typically create a temporary value of the same type as the property, tailor that value to represent the desired initial state, and then return that temporary value to be used as the property’s default value.
*/


/**
** The following defines a structure called Chessboard, which models a board for the game of chess. 
** Chess is played on an 8 x 8 board, with alternating black and white squares.

To represent this game board, the Chessboard structure has a single property called boardColors, which is an array of 64 Bool values. A value of true in the array represents a black square and a value of false represents a white square. The first item in the array represents the top left square on the board and the last item in the array represents the bottom right square on the board.

The boardColors array is initialized with a closure to set up its color values:
*/
struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard: [Bool] = []
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

/**
Whenever a new Chessboard instance is created, the closure is executed, and the default value of boardColors is calculated and returned. The closure in the example above calculates and sets the appropriate color for each square on the board in a temporary array called temporaryBoard, and returns this temporary array as the closure’s return value once its setup is complete. The returned array value is stored in boardColors and can be queried with the squareIsBlackAt(row:column:) utility function:
*/
let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
// Prints "true"
print(board.squareIsBlackAt(row: 7, column: 7))
// Prints "false"