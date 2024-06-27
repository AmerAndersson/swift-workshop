
// String Literals
// Use a string literal as an initial value for a constant or variable:
let someString = "Some string literal value"
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print(someString)
print(singleLineString)
print(multilineString)
print("-----------------------------------")

// Multiline String Literals
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)
print("-----------------------------------")

// but you don’t want the line breaks to be part of the string’s value, 
// write a backslash (\) at the end of those lines:
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)
print("-----------------------------------")

// To make a multiline string literal that begins or ends with a line feed, 
// write a blank line as the first or last line.
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print(lineBreaks)
print("-----------------------------------")

/**
* Special Characters in String Literals
* String literals can include the following special characters:

* The escaped special characters \0 (null character), \\ (backslash), 
* \t (horizontal tab), \n (line feed), \r (carriage return), 
* \" (double quotation mark) and \' (single quotation mark)

* An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number (Unicode)
*/
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
print(wiseWords)
print(dollarSign)
print(blackHeart)
print(sparklingHeart)
print("-----------------------------------")
// To include the text """ in a multiline string, escape at least one of the quotation marks
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)
print("-----------------------------------")
// Extended String Delimiter # 
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
Escaping all three quotation marks:"""
"""#
print(threeMoreDoubleQuotationMarks)
print("-----------------------------------")

/**
* Initializing an Empty String
* To create an empty String value as the starting point for building a longer string,
* either assign an empty string literal to a variable or initialize a new String instance 
* with initializer syntax:
*/
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

/**
* Find out whether a String value is empty by checking its Boolean isEmpty property:,
* use its isEmpty property instead of comparing the length of one of the views to 0. 
* Unlike with isEmpty, calculating a view’s count property requires 
* iterating through the elements of the string.
*/
if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"

if anotherEmptyString.isEmpty {
   print("Nothing to see here either")
}
print("-----------------------------------")

// String Mutability 
// You indicate whether a particular String can be modified (or mutated) 
// by assigning it to a variable (in which case it can be modified), 
// or to a constant (in which case it can’t be modified):

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"
print(variableString)

let constantString = "Highlander"
// constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified
print("-----------------------------------")

// * Working with Characters
// access the individual Character values for a String 
// by iterating over the string with a for-in loop
for character in "Dog!🐶" {
    print(character)
} // ["D, o, g, !, 🐶"]
print("-----------------------------------")

// create a stand-alone Character constant or variable 
// from a single-character string literal by providing a Character type annotation
let dogCharExc: [Character] = ["🐶", "!"]
let exclamationMark = String(dogCharExc)
print("\(exclamationMark)") //[🐶, !]

// String values can be constructed by passing an array of 
// Character values as an argument to its initializer:

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"
print("-----------------------------------")

// Concatenating Strings and Characters
// You can concatenate Strings and Characters using the + operator:
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"
print(welcome)

// can also append a String value to an existing String
// variable with the addition assignment operator (+=):
var instruction = "look over"
instruction += string2
// instruction now equals "look over there"
print(instruction)
print("-----------------------------------")

// You can append a Character value to a String variable with the String type’s append() method
let exclamationMarks: Character = "!"
welcome.append(exclamationMarks)
// welcome now equals "hello there!"
print(welcome)
print("-----------------------------------")
// If you’re using multiline string literals to build up the lines of a longer string, 
// you want every line in the string to end with a line break, including the last line
let goodStart = """
    one
    two

    """
let end = """
    three
    """
print(goodStart + end)
// Prints three lines:
// one
// two
// three
print("-----------------------------------")

// * String Interpolation prefixed by a backslash (\):
// You can interpolate a String value with a String literal, 
// by adding a String literal to the end of the String literal:
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
print(message)
print("-----------------------------------")

//* can use extended string delimiters to create strings containing 
// characters that would otherwise be treated as a string interpolation
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."
print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."
print("-----------------------------------")

// Unicode Scalar Values
let frontFaceBabyChick = "\u{1F425}"
let smallLetter = "\u{0061}"
print(frontFaceBabyChick)
print(smallLetter)
print("-----------------------------------")

// * Unicode Scalar Values
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é
print(eAcute)
print(combinedEAcute)
print("-----------------------------------")

// * Unicode Scalar Values
// Hangul syllables from the Korean alphabet can be represented 
// as either a precomposed or decomposed sequence. 
// Both of these representations qualify as a single Character value in Swift:
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한
print(precomposed)
print(decomposed)
print("-----------------------------------")
// Extended grapheme clusters enable scalars for enclosing marks (such as COMBINING ENCLOSING CIRCLE, or U+20DD) 
// to enclose other Unicode scalars as part of a single Character value:
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝
print(enclosedEAcute)
print("-----------------------------------")
// Unicode scalars for regional indicator symbols can be combined in pairs to make a single Character value, 
// such as this combination of REGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA) and REGIONAL INDICATOR SYMBOL LETTER S (U+1F1F8): 
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸
print(regionalIndicatorForUS)
print("-----------------------------------") 

// REGIONAL INDICATOR SYMBOL LETTER Sverige U+1F1F8 U+1F1EA
let regionalIndicatorForSweden: Character = "\u{1F1F8}\u{1F1EA}"
// regionalIndicatorForSweden is SE
print(regionalIndicatorForSweden)
print("-----------------------------------")

// * Counting Characters
// Counting Characters
// To retrieve a count of the Character values in a string, use the count property of the string:
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie: \(unusualMenagerie)")
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"
print("-----------------------------------")

/**
if you initialize a new string with the four-character word cafe,
and then append a COMBINING ACUTE ACCENT (U+0301) to the end of the string, 
the resulting string will still have a character count of 4, with a fourth character of é, not e:
*/
import Foundation

var word = "cafe" as NSString
print("the number of characters in \(word) is \(word.length)")
// Prints "the number of characters in cafe is 4"

//word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.length)")
// Prints "the number of characters in café is 4"

var words = "cafe"
print("the number of characters in \(words) is \(words.count)")
// Prints "the number of characters in cafe is 4"

words += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(words) is \(words.count)")
// Prints "the number of characters in café is 4"
print("-----------------------------------")


// * Accessing and Modifying a String
// You access and modify a string through its methods and properties, 
// or by using subscript syntax. 
// * String Indices
// Each String value has an associated index type, String.Index,
// which corresponds to the position of each Character in the string.
// You can use subscript syntax to access individual characters in a String value:

let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])
// G
let beforeEnd = greeting[greeting.index(before: greeting.endIndex)]
print(beforeEnd)
//[!] 
let afterStart = greeting[greeting.index(after: greeting.startIndex)]
print(afterStart)
// u
let index = greeting.index(greeting.startIndex, offsetBy: 8)
print(greeting[index])
// a
print("-----------------------------------")

// 
/**
* Use the indices property to access all of the indices of individual characters in a string
* * Note
* You can use the startIndex and endIndex properties and the index(before:), index(after:), 
* and index(_:offsetBy:) methods on any type that conforms to the Collection protocol.
* This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set
*/
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}// Prints "G u t e n   T a g ! "
print("")

// Inserting and Removing
// to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
var welcomes = "hello"
welcomes.insert("!", at: welcomes.endIndex)
// welcome now equals "hello!"
print(welcomes)
welcomes.insert(contentsOf: " there", at: welcomes.index(before: welcomes.endIndex))
// welcome now equals "hello there!"
print(welcomes)
print("-----------------------------------")

// To remove a single character from a string at a specified index, use the remove(at:) method,
// and to remove a substring at a specified range, use the removeSubrange(_:) method:
/**
* * Note
You can use the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods on any type that conforms to the RangeReplaceableCollection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set
*/
welcomes.remove(at: welcomes.index(before: welcomes.endIndex))
// welcome now equals "hello there"
print(welcomes)
let range = welcomes.index(welcomes.endIndex, offsetBy: -6)..<welcomes.endIndex
welcomes.removeSubrange(range)
// welcome now equals "hello"
print(welcomes)
print("-----------------------------------")

// * * Substring
// you use substrings for only a short amount of time while performing actions on a string. 
// When you’re ready to store the result for a longer time, you convert the substring to an instance of String.
let greetings = "Hello, world!"
let indexe = greetings.firstIndex(of: ",") ?? greetings.endIndex
let beginning = greetings[..<indexe]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
// newString is "Hello"
print(newString)

let ends = greetings[indexe...]
// end is ", world!"
print(ends)
print("-----------------------------------")

// Comparing String 
// Swift provides three ways to compare textual values:
// string and character equality, prefix equality, and suffix equality.
// String and character equality is checked with the “equal to” operator (==) and the “not equal to” operator (!=),

let quotations = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotations == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
/**
Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent. Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they’re composed from different Unicode scalars behind the scenes.

For example, LATIN SMALL LETTER E WITH ACUTE (U+00E9) is canonically equivalent to LATIN SMALL LETTER E (U+0065) followed by COMBINING ACUTE ACCENT (U+0301). Both of these extended grapheme clusters are valid ways to represent the character é, and so they’re considered to be canonically equivalent
*/
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"


// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"


if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal

print("-----------------------------------")

/**
* Conversely, LATIN CAPITAL LETTER A (U+0041, or "A"), as used in English, 
* is not equivalent to CYRILLIC CAPITAL LETTER A (U+0410, or "А"), as used in Russian. 
* The characters are visually similar, but don’t have the same linguistic meaning:
*/
let latinCapitalLetterA: Character = "\u{41}"


let cyrillicCapitalLetterA: Character = "\u{0410}"


if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}
// Prints "These two characters aren't equivalent."

print("-----------------------------------")

/**
* To check whether a string has a particular string prefix or suffix, 
* * hasPrefix(_:) and hasSuffix(_:) methods, 
* both of which take a single argument of type String and return a Boolean value.
* Consider an array of strings representing the scene locations from the first two acts of Shakespeare’s Romeo and Juliet:
*/
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
// the hasPrefix(_:) method with the romeoAndJuliet array to count the number of scenes in Act 1 of the play:


var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1 of the play")
// Prints "There are 5 scenes in Act 1"


var act2SceneCount = 0
for scenes in romeoAndJuliet {
    if scenes.hasPrefix("Act 2 ") {
        act2SceneCount += 1
    }
}
print("There are \(act2SceneCount) scenes in Act 2 of the play")
// Prints "There are 5 scenes in Act 1"

print("-----------------------------------")

// hasSuffix(_:) method to count the number of scenes 
// that take place in or around Capulet’s mansion and Friar Lawrence’s cell:

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"
print("-----------------------------------")

/**
** access a String value in one of three other Unicode-compliant representations:
A collection of UTF-8 code units (accessed with the string’s utf8 property)
A collection of UTF-16 code units (accessed with the string’s utf16 property)
A collection of 21-bit Unicode scalar values, equivalent to the string’s UTF-32 encoding form 
(accessed with the string’s unicodeScalars property)
Each example below shows a different representation of the following string, which is made up of the characters D, o, g, ‼ (DOUBLE EXCLAMATION MARK, or Unicode scalar U+203C), and the 🐶 character (DOG FACE, or Unicode scalar U+1F436):
*/
let dogString = "Dog‼🐶"

// Accessing UTF-8 Code Units 
for utf8CodeUnits in dogString.utf8 {
    print("\(utf8CodeUnits) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "


// Accessing UTF-16 Code Units 
for utf16CodeUnits  in dogString.utf16 {
    print("\(utf16CodeUnits ) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "

// Accessing 21-bit Unicode Scalar Values
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "
print("-----------------------------------")
 
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶


