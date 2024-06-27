/// * Switch
let someCharacter: Character = "a"
switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet")
case "z":
    print("The last letter of the Latin alphabet")
default:
    print("Some other character")
}

/// Like if statements, switch statements also have an expression form:
let anotherCharacter: Character = "z"
let message = switch anotherCharacter {
case "a":
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}
print(message)

/// A single case that matches both "a" and "A"
let anotherCharacters: Character = "a"
switch anotherCharacters {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
print("---------- Interval Matching ----------")

/// Interval Matching
/// uses number intervals to provide a natural-language count for numbers of any size
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

print("---------- Underscore ----------")
/// The underscore character (_), to match any possible value.
let (_, _, age) = ("John", "Doe", 30)
print("Age: \(age)")

let (firstName, lastName, ages) = ("John", "Doe", 30)
print("Full Name: \(firstName) \(lastName)")
print("Age: \(ages)")

print("---------- (x,y) ----------")
/// Takes an (x, y) point, expressed as a simple tuple of type (Int, Int),
/// and categorizes it on the graph
let somePoint = (x: 1, y: 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
print("---------- Value binding ----------")
/// Value binding:
/// This behavior is known as value binding,
/// because the values are bound to temporary constants
/// or variables within the case’s body.
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
/// the final case matches all possible remaining values,
/// and so a default case isn’t needed to make the switch statement exhaustive.

print("---------- Where Clause ----------")
/// * Where
/// A switch case can use a where clause to check for additional conditions.
/// The example below categorizes an (x, y) point on the following graph:
/// The switch statement determines whether the point is on the green diagonal line where x == y,
/// on the purple diagonal line where x == -y, or neither.
/// The three switch cases declare placeholder constants x and y,
/// which temporarily take on the two tuple values from yetAnotherPoint. 
/// These constants are used as part of a where clause, to create a dynamic filter. 
/// The switch case matches the current value of point only if the where clause’s condition evaluates
/// to true for that value. the final case matches all possible remaining values,
/// and so a default case isn’t needed to make the switch statement exhaustive.
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}/// Prints "(1, -1) is on the line x == -y"


/// Switches support any kind of data and a wide variety 
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}/// Prints "Is it a spicy red pepper?

print("---------- Compound Cases ----------")
/// Multiple switch cases that share the same body can be combined 
/// by writing several patterns after case, with a comma between each of the patterns. 
/// If any of the patterns match, then the case is considered to match. 
/// The patterns can be written over multiple lines if the list is long
let someCharacters: Character = "e"
switch someCharacters {
case "a", "e", "i", "o", "u":
    print("\(someCharacters) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacters) is a consonant")
default:
    print("\(someCharacters) isn't a vowel or a consonant")
}
/// The switch statement’s first case matches all five lowercase vowels in the English language. 
/// Similarly, its second case matches all lowercase English consonants. 
/// Finally, the default case matches any other character.


print("---------- Compound cases bindings ----------")
/// Compound cases can also include value bindings. 
/// All of the patterns of a compound case have to include the same set of value bindings,
/// and each binding has to get a value of the same type from all of the patterns in the compound case.
/// This ensures that, no matter which part of the compound case matched, 
/// the code in the body of the case can always access a value for the bindings and that the value always has the same type.
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"
/// The case above has two patterns: (let distance, 0)
/// matches points on the x-axis and (0, let distance) matches points on the y-axis. Both patterns include a binding for distance and distance is an integer in both patterns — which means that the code in the body of the case can always access a value for distance.