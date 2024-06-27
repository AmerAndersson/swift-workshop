
/**
** Optional Chaining
** Access members of an optional value without unwrapping.
Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil. If the optional contains a value, the property, method, or subscript call succeeds; if the optional is nil, the property, method, or subscript call returns nil. Multiple queries can be chained together, and the entire chain fails gracefully if any link in the chain is nil

Residence instances have a single Int property called numberOfRooms, with a default value of 1. Person instances have an optional residence property of type Residence?.

If you create a new Person instance, its residence property is default initialized to nil, by virtue of being optional.
john has a residence property value of nil:
*/

// Two classes called Person and Residence are defined:
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

// Optional chaining provides an alternative way to access the value of numberOfRooms. 
// To use optional chaining, use a question mark in place of the exclamation point:
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// can assign a Residence instance to john.residence,
// so that it no longer has a nil value:
// john.residence now contains an actual Residence instance, rather than nil.
// If you try to access numberOfRooms with the same optional chaining as before, 
// it will now return an Int? that contains the default numberOfRooms value of 1:
john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."