
/** 
* * Swift Bridging Between Set and NSSet
* A set stores distinct values of the same type in a collection with no defined ordering.
* You can use a set instead of an array when the order of items isn’t important, 
* or when you need to ensure that an item only appears once.
*/

let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}
// Prints "No thanks, too sweet."


var primes: Set = [2, 3, 5, 7]

// Tests whether primes is a subset of a Range<Int>
print(primes.isSubset(of: 0..<10))
// Prints "true"


// Performs an intersection with an Array<Int>
let favoriteNumbers = [5, 7, 15, 21]
print(primes.intersection(favoriteNumbers))
// Prints "[5, 7]"
print("-----------------------------------")

// Sequence and Collection Operations
// In addition to the Set type’s set operations, 
//you can use any nonmutating sequence or collection methods with a set.

if primes.isEmpty {
    print("No primes!")
} else {
    print("We have \(primes.count) primes.")
}
// Prints "We have 4 primes."


let primesSum = primes.reduce(0, +)
// 'primesSum' == 17
print(primesSum)

let primeStrings = primes.sorted().map(String.init)
// 'primeStrings' == ["2", "3", "5", "7"]
print(primeStrings)

print("-----------------------------------")

// iterate through a set’s unordered elements with a for-in loop.
for number in primes {
    print(number)
}
// Prints "5"
// Prints "7"
// Prints "2"
// Prints "3"

print("-----------------------------------")

// Many sequence and collection operations return an array 
// or a type-erasing collection wrapper instead of a set. 
// To restore efficient set operations, create a new set from the result.

let primesStrings = primes.map(String.init)
// 'primesStrings' is of type Array<String>
print("primesStrings: \(primesStrings)")

let primesStringsSet = Set(primes.map(String.init))
// 'primesStringsSet' is of type Set<String>
print("primesStringsSet: \(primesStringsSet)")

print("-----------------------------------")

var mySet = Set<Int>()
mySet.insert(1)
mySet.insert(2)
mySet.insert(3)
mySet.insert(4)
mySet.insert(5)
mySet.insert(6)
mySet.insert(7)
mySet.insert(8)
mySet.insert(9)
mySet.insert(10)
// printout 
print("Total Elements: \(mySet.count)")
print("-----------------------------------")
