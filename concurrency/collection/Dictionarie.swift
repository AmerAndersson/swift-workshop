/// * Dictionaries
/// store the names of international airports
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
/// As with arrays, you don’t have to write the type of the dictionary 
/// if you’re initializing it with a dictionary literal whose keys and values have consistent types
var airport = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

///add new item to a dictionary with subscript syntax
airports["LHR"] = "London Heathrow"
airports["APL"] = "Apple International"
// "Apple International" isn't the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary

/// The updateValue(_:forKey:) method sets a value for a key if none exists, 
/// or updates the value if that key already exists
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
print("---------------------------") 

// Prints "The old value for DUB was Dublin."
/// access and modify a dictionary through its methods and properties
/// access and modify a dictionary through its properties
print("The airports dictionary contains \(airports.count) items.")

for (airportCode, airportName) in airports {
  print("\(airportCode): \(airportName)")
}
print("---------------------------") 

/// The Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}
print("---------------------------") 

/// Because it’s possible to request a key for which no value exists
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}
print("---------------------------") 

// remove a key-value pair from a dictionary with the removeValue(forKey:) method.
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport.
print("The airports dictionary contains \(airports.count) items.")
print("---------------------------") 

/// Iterating Over a Dictionary
/// Each item in the dictionary is returned as a (key, value) tuple
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
print("---------------------------") 

/// retrieve an iterable collection of a dictionary’s keys 
//  or values by accessing its keys and values properties:
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ
print("---------------------------") 

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson
print("---------------------------") 

/// If you need to use a dictionary’s keys or values with an API that takes an Array instance, 
/// initialize a new array with the keys or values property:
let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]
for airport in airports.keys {
  print("Airport code: \(airport)")
}
print("---------------------------") 

let airportNames = [String](airports.values)
for airportName in airports.keys {
  print("Airport name: \(airportName)")
}
// airportNames is ["London Heathrow", "Toronto Pearson"]
print("---------------------------") 


/// You use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.
/// Dictionaries are an unordered collection, so their keys and values are iterated over in an arbitrary order.
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

print("---------------------------") 
/// empty dictionary literal ([:])
let emptyDictionaryC: [String: Character] = [:]
let emptyDictionaryS: [String: String] = [:]
let emptyDictionaryD: [String: Double] = [:]
let emptyDictionaryF: [String: Float] = [:]
let emptyDictionaryB: [String: Bool] = [:]
let emptyDictionaryI: [String: Int] = [:]

var namesOfIntegers: [Int: String] = [:]
// namesOfIntegers is an empty [Int: String] dictionary
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers.count)
namesOfIntegers = [:]
print(namesOfIntegers.count)
// namesOfIntegers is once again an empty dictionary of type [Int: String]
print("---------------------------") 

/// the user dictionary
var user: [String: String] = ["id": "@twostraws", "name": "John"]

if let idValue = user.updateValue("john@twostraws.com", forKey: "id") {
    print("The old value for id was \(idValue).")
}
if let nameValue = user.updateValue("John Smith", forKey: "name") {
    print("The old value for name was \(nameValue).")
}
print(user.count)
// Iterate over the key-value pairs in the user dictionary
for (key, value) in user {
    print("\(key): \(value)")
}

print("---------------------------")

/// An occupations
var occupations: [String: Float] = ["Engineer": 100.0]
for (key, value) in occupations{
print("\(key): \(value)")
}
print("---------------------------") 

let employee2 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

print("---------------------------") 
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]
print(hasGraduated["Eric", default: false])

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])
print(olympics[2016, default: "Unknown"])
print(olympics[2021, default: "Unknown"])
print("---------------------------") 

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

for (key, value) in heights{
  print("\(key) \(value)")
}
print("---------------------------") 

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
for (key, value) in archEnemies{
  print("\(key) \(value)")
}
print("---------------------------")


let age = ["Ranjit": 1930, "Sabby": 2008]
/// Sort the dictionary by key in ascending order
let sortedAge = age.sorted(by: <)
print(sortedAge)
for (key, value) in sortedAge {
  print("\(key) \(value)")
}
/// Output: [(key: "Ranjit", value: 1930), (key: "Sabby", value: 2008)]
print("---------------------------")


let info = ["Carlos": 1999, "Nelson": 1987]
/// Sort the dictionary by value in ascending order
/// The closure { $0.value < $1.value } checks whether the first value is less than the second value
let sortedInfo = info.sorted(by: { $0.value < $1.value })
print(sortedInfo)
for (key, value) in sortedInfo {
  print("\(key): \(value)")
}
/// Output: [(key: "Nelson", value: 1987), (key: "Carlos", value: 1999)]
print("---------------------------")


let infos = ["Carlos": 1999, "Nelson": 1987, "Alice": 2005]

// Sort the dictionary by value in descending order
let sortedInfoDesc = infos.sorted(by: { $0.value > $1.value })

// Print the sorted dictionary
for (name, age) in sortedInfoDesc {
    print("\(name): \(age)")
}
print("---------------------------")

/// The .sort(by: >) method is used to sort the elements of a mutable collection in-place.
/// It arranges the elements based on the provided predicate (greater-than operator > in this case).
/// If you use .sort(by: >), the original collection will be modified, and the sorted elements will replace the existing ones.
var numbers = [5, 2, 8, 1, 3]
numbers.sort(by: >) // Sorts in descending order
print(numbers) /// Output: [8, 5, 3, 2, 1]
print("---------------------------")


/// The .sorted(by: >) method returns a new array containing the sorted elements.
/// It does not modify the original collection; instead, it creates a new sorted array.
let originalNumbers = [5, 2, 8, 1, 3]
let sortedNumbers = originalNumbers.sorted(by: >) // Creates a new sorted array
print(sortedNumbers) /// Output: [8, 5, 3, 2, 1]
print(originalNumbers) /// Original array remains unchanged


