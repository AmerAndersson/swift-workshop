
import Foundation
/**
* Arrays are one of the most commonly used data types in an app. 
* You use arrays to organize your app’s data. Specifically, 
* you use the Array type to hold elements of a single type, the array’s Element type
*/

// An array of 'Int' elements
let oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15]
if oddNumbers.isEmpty {
    print("I don't know any odd numbers.")
} else {
    print("I know \(oddNumbers.count) odd numbers.")
}// Prints "I know 8 odd numbers."

// * first and last properties:
// for safe access to the value of the array’s first and last elements. 
// If the array is empty, these properties are nil.
if let firstElement = oddNumbers.first, let lastElement = oddNumbers.last {
    print(firstElement, lastElement, separator: ", ")
}// Prints "1, 15"

// access individual array elements through a subscript
print(oddNumbers[0], oddNumbers[3], separator: ", ")
// Prints "1, 7"


// accessing Array Values
let streets = ["Albemarle", "Brandywine", "Chesapeake"]
for street in streets {
    print("I don't live on \(street).")
}
print("-------------------------------")


// to store a list of the names of students that are signed up for a class you’re teaching.
// During the registration period, you need to add and remove names as students add and drop the class.
var students = ["Ben", "Ivy", "Jordell"]

// Adding elements 
students.append("Maxime")

// Add multiple elements 
students.append(contentsOf: ["Shakia", "William"])
// ["Ben", "Ivy", "Jordell", "Maxime", "Shakia", "William"]
print(students)

// add new elements in the middle
students.insert("Liam", at: 3)
// ["Ben", "Ivy", "Jordell", "Liam", "Maxime", "Shakia", "William"]
print(students)

// Removing Elements
// Ben's family is moving to another state
students.remove(at: 0)
// ["Ivy", "Jordell", "Liam", "Maxime", "Shakia", "William"]
print(students)

// William is signing up for a different class
students.removeLast()
// ["Ivy", "Jordell", "Liam", "Maxime", "Shakia"]
// students.removeSubrange(at: )
print(students)

var student = ["Alice", "Bob", "Charlie", "David", "Eve"]
// Remove elements from index 1 to 2 (inclusive)
student.removeSubrange(1...2)
print(student) // Output: ["Alice", "David", "Eve"]

if let i = students.firstIndex(of: "Maxime") {
    students[i] = "Max"
}
// ["Ivy", "Jordell", "Liam", "Max", "Shakia"]
print(students)
print("-------------------------------")

// Growing the Size of an Array
var favoriteColors: [String] = []
favoriteColors.reserveCapacity(100) // Preallocate space for 100 colors
favoriteColors.append("Blue")
favoriteColors.append("Green")
favoriteColors.append("Red")
favoriteColors.append("Yellow")
favoriteColors.append("Purple")
favoriteColors.append("Orange")
favoriteColors.append("White")
favoriteColors.append("Black")
favoriteColors.append("Gray")
print("Initial capacity: \(favoriteColors.capacity)")
print("Number of color: \(favoriteColors.count)")

var shoppingCart: [String] = []
print("Initial capacity: \(shoppingCart.capacity)") // Prints 0
shoppingCart.append("Shoes")
shoppingCart.append("T-shirt")
print("Updated capacity: \(shoppingCart.capacity)") // Prints the actual capacity

var tasks: [String] = []
tasks.append("Buy groceries")
tasks.append("Finish report")
tasks.append("Call client")
print("Number of tasks: \(tasks.count)") // Prints 3

print("-------------------------------")

/**
* * Modifying Copies of Arrays
* Each array has an independent value that includes the values of all of its elements. For simple types * such as integers and other structures, this means that when you change a value in one array, 
* the value of that element does not change in any copies of the array
*/

var numbers = [1, 2, 3, 4, 5]
var numbersCopy = numbers
numbers[0] = 100
print(numbers)
// Prints "[100, 2, 3, 4, 5]"
print(numbersCopy)
// Prints "[1, 2, 3, 4, 5]"
print("-------------------------------")

/**
If the elements in an array are instances of a class, the semantics are the same, though they might appear different at first. In this case, the values stored in the array are references to objects that live outside the array. If you change a reference to an object in one array, only that array has a reference to the new object. However, if two arrays contain references to the same object, you can observe changes to that object’s properties from both arrays
*/
// An integer type with reference semantics
class IntegerReference {
    var value = 10
}
var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers


// Modifications to an instance are visible from either array
firstIntegers[0].value = 100
print(secondIntegers[0].value)
// Prints "100"


// Replacements, additions, and removals are still visible
// only in the modified array
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value)
// Prints "10"
print(secondIntegers[0].value)
// Prints "100"
print("-------------------------------")

/**
Arrays, like all variable-size collections in the standard library, use copy-on-write optimization. Multiple copies of an array share the same storage until you modify one of the copies. When that happens, the array being modified replaces its storage with a uniquely owned copy of itself, which is then modified in place. Optimizations are sometimes applied that can reduce the amount of copying.

This means that if an array is sharing storage with other copies, the first mutating operation on that array incurs the cost of copying the array. An array that is the sole owner of its storage can perform mutating operations in place.

In the example below, a numbers array is created along with two copies that share the same storage. When the original numbers array is modified, it makes a unique copy of its storage before making the modification. Further modifications to numbers are made in place, while the two copies continue to share the original storage.
*/

var number = [1, 2, 3, 4, 5]
var firstCopy = number
var secondCopy = number

// The storage for 'numbers' is copied here
number[0] = 100
number[1] = 200
number[2] = 300

print("numbers is \(number)")
// 'numbers' is [100, 200, 300, 4, 5]
print("firstCopy is \(firstCopy)")
// 'firstCopy' is [1, 2, 3, 4, 5]
print("secondCopy is \(secondCopy)")
// 'secondCopy' is [1, 2, 3, 4, 5]
print("-------------------------------")

// Create an empty array, Shortened forms are preferred
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."

someInts.append(3)
// someInts now contains 1 value of type Int
print("someInts is of type [Int] with \(someInts.count) items.")

someInts = []
// someInts is now an empty array, but is still of type [Int]
print("someInts is of type [Int] with \(someInts.count) items.")


var emptyArrayI: [Int] = []
var emptyArrayB: [Bool] = []
var emptyArrayF: [Float] = []
var emptyDoubles: [Double] = []
var emptyArrayS: [String] = []
// The full type name is also allowed
var emptyFloats: Array<Float> = Array()

// Creating an Array with a Default Value
var digitCounts = Array(repeating: 0, count: 10)
// [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var threeDoubles = Array(repeating: 0.0, count: 3)
// [0.0, 0.0, 0.0]
print(digitCounts)
print(threeDoubles)

// Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// equals [2.5, 2.5, 2.5]
print(anotherThreeDoubles)

var sixDoubles = threeDoubles + anotherThreeDoubles
// equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

print(sixDoubles)
print("-------------------------------")

// Creating an Array with an Array Literal
// shoppingList has been initialized with two initial items
var shoppingList: [String] = ["Eggs", "Milk"]

//add a new item to the end of an array
shoppingList.append("Flour")

// append an array of one or more compatible items with 
// the addition assignment operator (+=):
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items

// Accessing and Modifying an Array
//To find out the number of items in an array, check its read-only count property:
print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 4 items."

// Use the Boolean isEmpty property as a shortcut for checking
// whether the count property is equal to 0:
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}
// Prints "The shopping list isn't empty."

// Retrieve a value from the array by using subscript syntax,
// passing the index of the value you want to retrieve within
// square brackets immediately after the name of the array:
var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"
print(firstItem)
// Prints "Eggs"

// subscript syntax to change an existing value at a given index
shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"
print(shoppingList)
// Prints "["Six eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]"

// use subscript syntax to change a range of values at once, 
// even if the replacement set of values has a different length than the range you are replacing.
// The following example replaces "Chocolate Spread", "Cheese", and "Butter" with "Bananas" 
// and "Apples":
shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items
print(shoppingList)
// Prints "["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]"

// To insert an item into the array at a specified index
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list
print(shoppingList)
// Prints "["Maple Syrup", "Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]"

// remove an item from the array 
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
print(shoppingList)
// Prints "["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]"
print(mapleSyrup)
// Prints "Maple Syrup
firstItem = shoppingList[0]
// firstItem is now equal to "Six eggs"
print(firstItem)
// Prints "Six eggs"

let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string
print(shoppingList)
// Prints "["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas"]"
print(apples)
// Prints "Apples"

// Iterating Over an Array
for item in shoppingList {
    print(item, terminator: ", ")
}
print("")
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

// If you need the integer index of each item as well as its value, 
// use the enumerated() method to // iterate over the array instead. 
// For each item in the array, the enumerated() method 
// returns a tuple composed of an integer and the item. 
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
print("-------------------------------")

