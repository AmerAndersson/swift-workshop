
/**
** Defining Model Classes for Optional Chaining

You can use optional chaining with calls to properties, methods, and subscripts that are more than one level deep. This enables you to drill down into subproperties within complex models of interrelated types, and to check whether it’s possible to access properties, methods, and subscripts on those subproperties.

The code snippets below define four model classes for use in several subsequent examples, including examples of multilevel optional chaining. These classes expand upon the Person and Residence model from above by adding a Room and Address class, with associated properties, methods, and subscripts.
Defining four model classes for use in several subsequent, including examples of multilevel optional chaining. 
These classes expand upon the Person and Residence model by adding a Room and Address class, 
with associated properties, methods, and subscripts.
*/

// Person instances have an optional residence property of type Residence?
class Person {
    var residence: Residence?
}

// The Residence class defines a variable property called rooms,
// which is initialized with an empty array of type [Room]:
class Residence {
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

// The Room class used for the rooms array is a simple class with one property called name, 
// and an initializer to set that property to a suitable room name:
class Room {
    let name: String
    init(name: String) { self.name = name }
}

// The final class in this model is called Address. 
// This class has three optional properties of type String?. 
// The first two properties, buildingName and buildingNumber, 
// are alternative ways to identify a particular building as part of an address. 
// The third property, street, is used to name the street for that address:
// The Address class also provides a method called buildingIdentifier(), 
// which has a return type of String?. This method checks the properties 
// of the address and returns buildingName if it has a value, or buildingNumber
// concatenated with street if both have values, or nil otherwise.

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}


// Accessing Properties Through Optional Chaining
// create a new Person instance, and  
// try to access its numberOfRooms property
// Because john.residence is nil, this optional chaining call fails 
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
} // Prints "Unable to retrieve the number of rooms."
print("-------------------------------------------")

// Attempt to set a property’s value through optional chaining:
// The attempt to set the address property of john.residence will fail,
// because john.residence is currently nil. The assignment is part of the optional chaining,
// which means none of the code on the right-hand side of the = operator is evaluated. 
// In the previous example, it’s not easy to see that someAddress is never evaluated,
//  because accessing a constant doesn’t have any side effects.
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

// The listing below does the same assignment, but it uses a function to create the address. 
// The function prints “Function was called” before returning a value, 
// which lets you see whether the right-hand side of the = operator was evaluated.
func createAddress() -> Address {
    print("Function was called.")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}

john.residence?.address = createAddress()
// You can tell that the createAddress() function isn’t called, because nothing is printed.

// Accessing Methods Through Optional Chaining
// You can use optional chaining with calls to methods that are more than one level deep. 
// This enables you to drill down into subproperties within complex models of interrelated types,

// Use an if statement to check whether it was possible to call the printNumberOfRooms() method, 
// even though the method doesn’t itself define a return value. Compare the return value from the printNumberOfRooms call against nil to see if the method call was successful:
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// Prints "It was not possible to print the number of rooms.

// The same is true if you attempt to set a property through optional chaining. 
// The example above in Accessing Properties Through Optional Chaining attempts 
// to set an address value for john.residence, even though the residence property is nil.
// Any attempt to set a property through optional chaining returns a value of type Void?,
// which enables you to compare against nil to see if the property was set successfully
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}// Prints "It was not possible to set the address."

// Accessing Subscripts Through Optional Chaining
// You can use optional chaining to try to retrieve and set a value 
// from a subscript on an optional value, and to check whether that subscript call is successful.

// Tries to retrieve the name of the first room in the rooms array of 
// the john.residence property using the subscript defined on the Residence class.
// Because john.residence is currently nil, the subscript call fails:
// The optional chaining question mark in this subscript call is placed immediately after john.residence,
// before the subscript brackets, because john.residence is the optional value on which optional chaining is being attempted.
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}// Prints "Unable to retrieve the first room name.

// Similarly, Try to set a new value through a subscript with optional chaining:
// This subscript setting attempt also fails, because residence is currently ni
john.residence?[0] = Room(name: "Bathroom")

// If you create and assign an actual Residence instance to john.residence, with one or more Room instances in its rooms array,
// you can use the Residence subscript to access the actual items in the rooms array through optional chaining:
let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse


if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}// Prints "The first room name is Living Room."

// Accessing Subscripts of Optional Type
// If a subscript returns a value of optional type 
// — such as the key subscript of Swift’s Dictionary type 
// — place a question mark after the subscript’s closing bracket to chain on its optional return value:
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]

// Tries to access the street property of the address property of the residence property of john.
// There are two levels of optional chaining in use here, to chain through the residence and address properties,
// both of which are of optional type:
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}// Prints "Unable to retrieve the address.
/**
The value of john.residence currently contains a valid Residence instance. 
However, the value of john.residence.address is currently nil. 
Because of this, the call to john.residence?.address?.street fails.

Note that in the example above, you are trying to retrieve the value of the street property. 
The type of this property is String?. The return value of john.residence?.address?.street is therefore also String?, 
even though two levels of optional chaining are applied in addition to the underlying optional type of the property.
*/
print("-------------------------------------------")

// If you set an actual Address instance as the value for john.residence.address, 
// and set an actual value for the address’s street property, 
// you can access the value of the street property through multilevel optional chaining:
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress


if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}// Prints "John's street name is Laurel Street."
// The attempt to set the address property of john.residence will succeed,
// because the value of john.residence currently contains a valid Residence instance.


/**
Chaining on Methods with Optional Return Values
The previous example shows how to retrieve the value of a property of optional type through optional chaining.
You can also use optional chaining to call a method that returns a value of optional type, 
and to chain on that method’s return value if needed.

The example below calls the Address class’s buildingIdentifier() method through optional chaining. 
This method returns a value of type String?. As described above, 
the ultimate return type of this method call after optional chaining is also String?:
*/
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}// Prints "John's building identifier is The Larches."

// If you want to perform further optional chaining on this method’s return value, 
// place the optional chaining question mark after the method’s parentheses:

if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier doesn't begin with \"The\".")
    }
}// Prints "John's building identifier begins with "The"."

/** 
Note
In the example above, you place the optional chaining question mark after the parentheses,
because the optional value you are chaining on is the buildingIdentifier() method’s return value, 
and not the buildingIdentifier() method itself.
*/