// Strings and Characters 
// Bridging Between String and NSString

let greeting = "Welcome!"
let name = "Rosa"
let personalizedGreeting = "Welcome, \(name)!"
print(personalizedGreeting)
// personalizedGreeting == "Welcome, Rosa!"


let price = 2
let number = 3
let cookiePrice = "\(number) cookies: $\(price * number)."
// cookiePrice == "3 cookies: $6."
print(cookiePrice)
print("-------------------------------------------")

// Combine strings using the concatenation operator (+)
let longerGreeting = greeting + " We're glad you're here!"
// longerGreeting == "Welcome! We're glad you're here!"
print(longerGreeting)
print("-------------------------------------------")

/**
Multiline string literals are enclosed in three double quotation marks ("""), with each delimiter on its own line. Indentation is stripped from each line of a multiline string literal to match the indentation of the closing delimiter.
*/

let banner = """
          __,
         (           o  /) _/_
          `.  , , , ,  //  /
        (___)(_(_/_(_ //_ (__
                     /)
                    (/
        """
print(banner)
print("-------------------------------------------")

// Modifying and Comparing Strings
// Strings always have value semantics. Modifying a copy of a string leaves the original unaffected.
var otherGreeting = greeting
otherGreeting += " Have a nice time!"
// otherGreeting == "Welcome! Have a nice time!"
print(otherGreeting)
print(greeting)
// Prints "Welcome!"
print("-------------------------------------------")
/**
Comparing strings for equality using the equal-to operator (==) or a relational operator (like < or >=) is always performed using Unicode canonical representation. As a result, different representations of a string compare as being equal.
The Unicode scalar value "\u{301}" modifies the preceding character to include an accent, so "e\u{301}" has the same canonical representation as the single Unicode scalar value "é".
*/
let cafe1 = "Cafe\u{301}"
let cafe2 = "Café"
print(cafe1 == cafe2)
// Prints "true"
print("-------------------------------------------")

// * Accessing String View Elements
// To find individual elements of a string, use the appropriate view for your task. 
// For example, to retrieve the first word of a longer string, you can search for a space 
// and then create a substring from a prefix of the string up to that point:
// The firstName constant is an instance of the Substring type—a type 
// that represents substrings of a string while sharing the original string’s storage.
// Substrings present the same interface as strings.

let names = "Marie Curie"
let firstSpace = names.firstIndex(of: " ") ?? names.endIndex
let firstName = names[..<firstSpace]
// firstName == "Marie"
print(firstName)

print("\(names)'s first name has \(firstName.count) letters.")
// Prints "Marie Curie's first name has 5 letters."

// Strings and their views share indices, so you can access the UTF-8 view 
// of the name string using the same firstSpace index.
print(Array(names.utf8[..<firstSpace]))
// Prints "[77, 97, 114, 105, 101]"
print("-------------------------------------------")

/**
* * Accessing a String’s Unicode Representation
* If you need to access the contents of a string as encoded in different Unicode encodings, 
* use one of the string’s unicodeScalars, utf16, or utf8 properties.
* Each property provides access to a view of the string as a series of code units, 
* each encoded in a different Unicode encoding. To demonstrate the different views available for every * string, the following examples use this String instance:
*/
let cafe = "Cafe\u{301} du 🌍"
print(cafe)
// Prints "Café du 🌍"
// The cafe string is a collection of the nine characters that are visible when the string is displayed
print(cafe.count)
// Prints "9"
print(Array(cafe))
// Prints "["C", "a", "f", "é", " ", "d", "u", " ", "🌍"]"
print("-------------------------------------------")

/**
* * Unicode Scalar View
* A string’s unicodeScalars property is a collection of Unicode scalar values, 
* the 21-bit codes that are the basic unit of Unicode. 
* Each scalar value is represented by a Unicode.Scalar instance and is equivalent to a UTF-32 code unit.
*/

print(cafe.unicodeScalars.count)
// Prints "10"
print(Array(cafe.unicodeScalars))
// Prints "["C", "a", "f", "e", "\u{0301}", " ", "d", "u", " ", "\u{0001F30D}"]"
print(cafe.unicodeScalars.map { $0.value })
// Prints "[67, 97, 102, 101, 769, 32, 100, 117, 32, 127757]"
print("-------------------------------------------")

/**
* * UTF-16 View
* A string’s utf16 property is a collection of UTF-16 code units, 
* the 16-bit encoding form of the string’s Unicode scalar values. 
* Each code unit is stored as a UInt16 instance.
*/
print(cafe.utf16.count)
// Prints "11"
print(Array(cafe.utf16))
// Prints "[67, 97, 102, 101, 769, 32, 100, 117, 32, 55356, 57101]"
print("-------------------------------------------")

// The elements of the utf16 view are the code units for the string when encoded in UTF-16. 
// These elements match those accessed through indexed NSString APIs.
import Foundation
let nsCafe = cafe as NSString
print(nsCafe.length)
// Prints "11"
print(nsCafe.character(at: 3))
// Prints "101"
print("-------------------------------------------")

/**
* * UTF-8 View
* A string’s utf8 property is a collection of UTF-8 code units, 
* the 8-bit encoding form of the string’s Unicode scalar values. 
* Each code unit is stored as a UInt8 instance.
*/
print(cafe.utf8.count)
// Prints "14"
print(Array(cafe.utf8))
// Prints "[67, 97, 102, 101, 204, 129, 32, 100, 117, 32, 240, 159, 140, 141]"
// The elements of the utf8 view are the code units for the string when encoded in UTF-8. 
// This representation matches the one used when String instances are passed to C APIs.
print("-------------------------------------------")

/**
** Measuring the Length of a String
When you need to know the length of a string, you must first consider what you’ll use the length for. Are you measuring the number of characters that will be displayed on the screen, or are you measuring the amount of storage needed for the string in a particular encoding? A single string can have greatly differing lengths when measured by its different views.

For example, an ASCII character like the capital letter A is represented by a single element in each of its four views. The Unicode scalar value of A is 65, which is small enough to fit in a single code unit in both UTF-16 and UTF-8.
*/
let capitalA = "A"
print(capitalA.count)
// Prints "1"
print(capitalA.unicodeScalars.count)
// Prints "1"
print(capitalA.utf16.count)
// Prints "1"
print(capitalA.utf8.count)
// Prints "1"
print("-------------------------------------------")

/**
* On the other hand, an emoji flag character is constructed from a pair of Unicode scalar values, 
* like "\u{1F1F5}" and "\u{1F1F7}". Each of these scalar values, in turn, is too large to fit into a * * single UTF-16 or UTF-8 code unit. As a result, each view of the string "🇵🇷" 
* reports a different length.  "\u{1F1F5}\u{1F1F7}" 
*/


let flag = "🇵🇷"
print(flag.count)
// Prints "1"
print(flag.unicodeScalars.count)
// Prints "2"
print(flag.utf16.count)
// Prints "4"
print(flag.utf8.count)
// Prints "8"
print("-------------------------------------------")


/**
Note that an index into one view may not have an exact corresponding position in another view. For example, the flag string declared above comprises a single character, but is composed of eight code units when encoded as UTF-8. The following code creates constants for the first and second positions in the flag.utf8 view. Accessing the utf8 view with these indices yields the first and second code UTF-8 units.
*/
let firstCodeUnit = flag.startIndex
let secondCodeUnit = flag.utf8.index(after: firstCodeUnit)
print(flag.utf8[firstCodeUnit])
// flag.utf8[firstCodeUnit] == 240
print(flag.utf8[secondCodeUnit])
// flag.utf8[secondCodeUnit] == 159
print("-------------------------------------------")

/**
* If you need to validate that an index from one string’s view 
* corresponds with an exact position in another view, use the index’s samePosition(in:) method 
* or the init(_:within:) initializer.
*/
if let exactIndex = secondCodeUnit.samePosition(in: flag) {
    print(flag[exactIndex])
} else {
    print("No exact match for this position.")
}
// Prints "No exact match for this position."