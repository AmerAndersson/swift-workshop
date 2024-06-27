
/// * Swift set
/// A set stores distinct values of the same type in a collection with no defined ordering.
/// You can use a set instead of an array when the order of items isn’t important, 
/// or when you need to ensure that an item only appears once.
/// The type of a Swift set is written as Set<Element>, where Element is the type that the set is allowed to store.
/// Unlike arrays, sets don’t have an equivalent shorthand form.

/// Creating a Set with an Array Literal
var anotherEmptySet: Set<String> = []
var myEmptySet: Set<Int> = []

/// create an empty set of a certain type using initializer syntax:
var letters = Set<Character>()
/// Creating a Set with an Array Literal
var letter: Set<Character> = []

/// add a new item into a set by calling the set’s insert(_:) method:
letter.insert("a")   /// letter now contains 1 value of type Character
letters.insert("b") ///  letters now contains 1 value of type Character

/// You access and modify a set through its methods and properties.
/// To find out the number of items in a set, check its read-only count property:
print("letters is of type Set<Character> with \(letter.count) items.")
print("letters is of type Set<Character> with \(letters.count) items.")

/// Creating a Set with an Array Literal
/// favoriteGenres has been initialized with three initial items
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenre: Set = ["Rock", "Classical", "Hip hop"]

/// add a new item into a set by calling the set’s insert(_:) method:
favoriteGenres.insert("Jazz") /// favoriteGenres now contains 4 items
favoriteGenre.insert("Jazz") /// favoriteGenre now contains 4 items

/// To find out the number of items in a set, check its read-only count property:
print("I have \(favoriteGenres.count) favorite music genres.")
print("I have \(favoriteGenre.count) favorite music genres.")

/// remove an item from a set by calling the set’s remove(_:) method
/// which removes the item if it’s a member of the set, 
/// and returns the removed value, or returns nil if the set didn’t contain it.
/// All items in a set can be removed with its removeAll() method.
if let removedGenre = favoriteGenre.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
} /// Prints "Rock? I'm over it."

/// To check whether a set contains a particular item, use the contains(_:) method.
if favoriteGenre.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}// Prints "It's too funky in here."


/// To find the number of elements in a set, use the `count` property:
let evenNumbers: Set = [2, 4, 6, 8]
print("Total Elements: \(evenNumbers.count)")

/// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if favoriteGenre.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

/// To check whether a set contains a particular item, use the contains(_:) method.
let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

/// iterate over the values in a set with a for-in loop.
let fruits: Set = ["Apple", "Peach", "Mango"]
     for fruit in fruits {
         print("\(fruit)", terminator: " ")
     }
    print("")

for genre in favoriteGenre {
     print("\(genre)", terminator: " ")
}
print("")

/// To iterate over the values of a set in a specific order, use the sorted() method,
/// which returns the set’s elements as an array sorted using the < operator.
for genre in favoriteGenre.sorted() {
     print("\(genre)", terminator: " ")
}
print("")
print("-------------------------------")
/// Performing Set Operations
/// You can efficiently perform fundamental set operations,
/// such as combining two sets together, determining which values two sets have in common, 
/// or determining whether two sets contain all, some, or none of the same values.

/// Fundamental Set Operations
/// The illustration below depicts two (sets a and b )
/// with the results of various set operations represented by the shaded regions.

/// Use the intersection(_:) method to create a new set with only the values common to both sets.
/// Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
/// Use the union(_:) method to create a new set with all of the values in both sets.
/// Use the subtracting(_:) method to create a new set with values not in the specified set.
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


print(oddDigits.union(evenDigits).sorted())
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print(oddDigits.intersection(evenDigits).sorted())
// []
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
// [1, 9]
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
// [1, 2, 9]
print("-------------------------------")

///A set is a collection of unique elements, where duplicates are not allowed.
var studentID: Set = [112, 114, 116, 118, 115]
print("Student ID: \(studentID)")

/// The intersection(_:) method creates a new set containing only the values common to both sets.
let setA: Set = [1, 2, 3, 4]
let setB: Set = [3, 4, 5, 6]
let commonValues = setA.intersection(setB).sorted()
print("Common values: \(commonValues)") /// Common values: [3, 4]

/// The symmetricDifference(_:) method creates a new set with values present in either set but not both.
let setX: Set = [1, 2, 3, 4]
let setY: Set = [3, 4, 5, 6]
let symmetricDiff = setX.symmetricDifference(setY).sorted()
print("Symmetric difference: \(symmetricDiff)") /// Symmetric difference: [1, 2, 5, 6]

/// The union(_:) method combines all values from both sets into a new set.
let setP: Set = [1, 2, 3]
let setQ: Set = [3, 4, 5]
let unionSet = setP.union(setQ).sorted()
print("Union set: \(unionSet)") /// Union set: [1, 2, 3, 4, 5]

/// The subtracting(_:) method creates a new set with values not present in the specified set.
let setM: Set = [1, 2, 3, 4]
let setN: Set = [3, 4, 5, 6]
let subtractedSet = setM.subtracting(setN).sorted()
print("Subtracted set: \(subtractedSet)") /// Subtracted set: [1, 2]
print("-------------------------------")

/**
* * Set Membership and Equality
The illustration below depicts three sets — a, b and c — with overlapping regions representing elements shared among sets. 
Set a is a superset of set b, because a contains all elements in b. Conversely, set b is a subset of set a, because all elements in b are also contained by a.
Set b and set c are disjoint with one another, because they share no elements in common.

Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
Use the isDisjoint(with:) method to determine whether two sets have no values in common.
*/

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print(houseAnimals.isSubset(of: farmAnimals))
// true
print(farmAnimals.isSuperset(of: houseAnimals))
// true
print(farmAnimals.isDisjoint(with: cityAnimals))
// true
print(houseAnimals == farmAnimals)
// not equal
print(farmAnimals == cityAnimals)
print("-------------------------------")

// set
var books: Set<String> = ["The Bluest Eye", "Foundation", "Girl, Woman, Other"]
let people = ["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"]
print(people.count)
print(people.sorted())
print(people.contains("Tom Cruise"))
print("---------------------------")

var peoples = Set<String>()
peoples.insert("Denzel Washington")
peoples.insert("Tom Cruise")
peoples.insert("Nicolas Cage")
peoples.insert("Samuel L Jackson")
print(peoples)