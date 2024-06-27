// Perform operations like assignment, arithmetic, and comparison.
let m = 10
var n  = 5
n = m 
print("A value \(n)")
print("B value \(m)")

// If the right side of the assignment is a tuple with multiple values, 
// its elements can be decomposed into multiple constants or variables at once:
let (x,y) = (1,2)

print("X = \(x) Y = \(y)")

// Arithmetic Operators
// Swift supports the four standard arithmetic operators for all number types:
// Addition (+), Subtraction (-), Multiplication (*), Division (/)

var a = 1 + 2       // equals 3
var b = 5 - 3       // equals 2
var c = 2 * 3       // equals 6
var d = 10.0 / 2.5  // equals 4.0
var f = 9 % 4

print("Addition: \(a) Subtraction: \(b)")
print("Multiplication: \(c) Division: \(d) Remainder: \(f)")

// String concatenation
print("hello, " + "world")  // equals "hello, world"

// Unary Minus Operator
// The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator:
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
print("minusThree: \(minusThree) plusThree: \(plusThree)")


// Unary Plus Operators 
// The unary plus operator (+) simply returns the value it operates on, without any change:
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
print("alsoMinusSix: \(alsoMinusSix)")


// Compound Assignment Operators
var n1 = 1
var n2 = 1
var n3 = 1
var n4 = 1
var n5 = 1
n1 += 2   // n1 is now equal to 3
n2 -= 2  // n2 is now equal to -1
n3 *= 2  // n3 is now equal to 2
n4 /= 2 // n4 is now equal to 0
n5 %= 2 // n5 is now equal to 1
print(n1, n2, n3, n4, n5)
print()

// Comparison Operators
// Swift supports the following comparison operators:
// Equal to (a == b), Not equal to (a != b)
// Greater than (a > b) ,Less than (a < b)
// Greater than or equal to (a >= b)
// Less than or equal to (a <= b)
// Note Swift also provides two identity operators (=== and !==),
// which you use to test whether two object references both refer to the same object instance
// Each of the comparison operators returns a Bool value to indicate whether or not the statement is true

// 1 == 1   // true because 1 is equal to 1
// 2 != 1   // true because 2 isn't equal to 1
// 2 > 1    // true because 2 is greater than 1
// 1 < 2    // true because 1 is less than 2
// 1 >= 1   // true because 1 is greater than or equal to 1
// 2 <= 1   // false because 2 isn't less than or equal to 1
// 1 === 1  // true because 1 is the same object as 1
// 1 !== 1  // false because 1 is not the same object as 1

// Comparison operators are often used in conditional statements, such as the if statement:

let name = "World"
if name == "World" {
    print("Hello, World!")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".
print("--------------------------------------")

/**
* You can compare two tuples if they have the same type and the same number of values.
* Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal. 
* Those two values are compared, and the result of that comparison determines the overall result of the tuple comparison. 
* If all the elements are equal, then the tuples themselves are equal.
*/

print((1, "zebra") < (2, "apple"))   // true because 1 is less than 2; "zebra" and "apple" aren't compared
print((3, "apple") < (3, "bird"))    // true because 3 is equal to 3, and "apple" is less than "bird"
print((4, "dog") == (4, "dog"))      // true because 4 is equal to 4, and "dog" is equal to "dog"
print("--------------------------------------")

// Tuples can be compared with a given operator only if the operator can be applied to each value in the respective tuples.
// as demonstrated in the code below, you can compare two tuples of type (String, Int) 
// because both String and Int values can be compared using the < operator. 
// In contrast, two tuples of type (String, Bool) 
// can’t be compared with the < operator because the < operator can’t be applied to Bool values.

// ("blue", -1) < ("purple", 1)        // OK, evaluates to true
// ("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
// Note: The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements.
// To compare tuples with seven or more elements, you must implement the comparison operators yourself.


/**
* Ternary Conditional Operators
* The ternary conditional operator is a special operator with three parts, which takes the form question ? answer1 : answer2. 
* It’s a shortcut for evaluating one of two expressions based on whether question is true or false.
* If question is true, it evaluates answer1 and returns its value; otherwise, it evaluates answer2 and returns its value.
* 
* which calculates the height for a table row. 
* The row height should be 50 points taller than the content height if the row has a header, 
* and 20 points taller if the row doesn’t have a header:
* 
* The first example’s use of the ternary conditional operator means that rowHeight 
* can be set to the correct value on a single line of code, which is more concise than the code used in the second example.
* 
* The ternary conditional operator provides an efficient shorthand for deciding which of two expressions to consider. 
* Use the ternary conditional operator with care, however. Its conciseness can lead to hard-to-read code if overused.
* Avoid combining multiple instances of the ternary conditional operator into one compound statement.
*/

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
print("RowHeight: \(rowHeight)")


let contentHeights = 40
let hasHeaders = true
let rowHeights: Int
if hasHeaders {
    rowHeights = contentHeights + 50
} else {
    rowHeights = contentHeights + 20
}
// rowHeight is equal to 90
print("RowHeight: \(rowHeights)")


// 

/**
* * Nil-Coalescing Operator
* The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, 
* or returns a default value b if a is nil. The expression a is always of an optional type. 
* The expression b must match the type that’s stored inside a.
* The nil-coalescing operator is shorthand for the code below
*/

// i is not nil, so i is returned
// j is returned if i is nil
// nil is returned if i is nil and j is not nil
// nil is returned if i is nil and j is nil
// the ternary conditional operator and forced unwrapping (i!)
// to access the value wrapped inside i when i isn’t nil, and to return j otherwise.
let i: Int? = 1
let j = 2
let cs = i ?? j
// c is equal to 1
print("c: \(cs)") 
print("c: \(i != nil ? i! : j)") 
 

// the nil-coalescing operator to choose between a default color name
// and an optional user-defined color name:
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
print("colorNameToUse: \(colorNameToUse)")

// If you assign a non-nil value to userDefinedColorName and perform the nil-coalescing operator check again, 
// the value wrapped inside userDefinedColorName is used instead of the default:
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName isn't nil, so colorNameToUse is set to "green"
print("colorNameToUse: \(colorNameToUse)")
print("--------------------------------------")
// Closed Range Operator 
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
print("--------------------------------------")
// Half-Open Range Operator 
// Note that the array contains four items, 
// but 0..<count only counts as far as 3 (the index of the last item in the array), because it’s a half-open range
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack
print("--------------------------------------")
// One-Sided Ranges
// The closed range operator has an alternative form for ranges that continue as far as possible in one direction
// — for example, a range that includes all the elements of an array from index 2 to the end of the array.
// In these cases, you can omit the value from one side of the range operator
for name in names[2...] {
    print(name)
}
// Brian
// Jack
print("--------------------------------------")

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
print("--------------------------------------")
// The half-open range operator also has a one-sided form that’s written with only its final value.
// Just like when you include a value on both sides, the final value isn’t part of the range
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
print("--------------------------------------")
// You can also check whether a one-sided range contains a particular value, as shown in the code below.
let range = ...5
print(range.contains(7))   // false
print(range.contains(5))   // true
print(range.contains(4))   // true
print(range.contains(-1))  // true
print("--------------------------------------")
/**
* Logical Operators
* Logical operators modify or combine the Boolean logic values true and false.
* Swift supports the three standard logical * operators found in C-based languages:
* Logical NOT (!a)
* Logical AND (a && b)
* Logical OR (a || b)
*/

// The logical NOT operator (!a) inverts a Boolean value so that true becomes false, and false becomes true.
// if !allowedEntry can be read as “if not allowed entry.” 
// The subsequent line is only executed if “not allowed entry” is true; that is, if allowedEntry is false.
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
print("--------------------------------------")
// Logical AND Operator
// The logical AND operator (a && b) creates logical expressions 
// where both values must be true for the overall expression to also be true.
// considers two Bool values and only allows access if both values are true
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
print("--------------------------------------")
// Logical OR Operator 
// The logical OR operator (a || b) creates logical expressions
// the first Bool value (hasDoorKey) is false, but the second value (knowsOverridePassword) is true. 
// Because one value is true, the overall expression also evaluates to true, and access is allowed.
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
print("--------------------------------------")

// 
/**
* Combining Logical Operators
* If we’ve entered the correct door code and passed the retina scan, 
* or if we have a valid door key, or if we know the emergency override password, then allow access.
* Based on the values of enteredDoorCode, passedRetinaScan, and hasDoorKey, the first two sub expressions are false.
* However, the emergency override password is known, so the overall compound expression still evaluates to true.
*/
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
// Prints "Welcome!"