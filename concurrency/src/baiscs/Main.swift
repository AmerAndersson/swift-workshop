// Numeric Literals
let decimalInteger = 17           // A decimal number, with no prefix
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation 
print(decimalInteger, binaryInteger)
print(octalInteger, hexadecimalInteger)

print("--------------------")
print()
// All of these floating-point literals have a decimal value of 12.1875:
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
print(decimalDouble, exponentDouble, hexadecimalDouble)

// Numeric literals can contain extra formatting to make them easier to read.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
print(paddedDouble, oneMillion, justOverOneMillion)
print("--------------------")
print()
// Floating Point Literals
let pi = 3.14159
let anotherPi = 3 + 0.14159
print("Pi: \(pi) \(anotherPi)")

let infinity = Double.infinity
let negativeInfinity = -infinity
let nan = Double.nan
print(infinity, negativeInfinity, nan)

// Boolean Literals
let trueLiteral = true
let falseLiteral = false

// String Literals
let stringLiteral = "Hello, World!"

// Character Literals
let characterLiteral = "A"
print(characterLiteral)

// Unicode Literals
let unicodeCharacterLiteral = "\u{1F600}"
print(unicodeCharacterLiteral)

// Prints "🐱"
let cat = "🐱"; print("Cat: \(cat)")

print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " .. ")

// multiple multiple variables on a single line without type annotation
var x = 1.0, y = 2.0, z = 3.0
print("x: \(x) y: \(y) z: \(z)")
print()

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
print("Pi: \(π) Lang: \(你好) DogCow: \(🐶🐮)")
print()

// type annotation
var red, green, blue: Double
red = 1.20
green = 2.30
blue = 3.40
print("Red: \(red) Green: \(green) Blue: \(blue)")
print()

// Integer Bounds
// access the minimum and maximum values 
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
print("Min: \(minValue)")
print("Max: \(maxValue)")


// Float Bounds
// access the minimum and maximum values
let minFloatValue = Float.leastNormalMagnitude
let maxFloatValue = Float.greatestFiniteMagnitude
print("MinF: \(minFloatValue)")
print("MaxF: \(maxFloatValue)")

// Double Bounds
// access the minimum and maximum values
let minDoubleValue = Double.leastNormalMagnitude
let maxDoubleValue = Double.greatestFiniteMagnitude
print("MinD: \(minDoubleValue)")
print("MaxD: \(maxDoubleValue)")
print()

// type annotation
var welcomeMessage: String
var friendlyWelcome: String 
welcomeMessage = "Hello, Amer!"
friendlyWelcome = "Bonjour!"
print(welcomeMessage)
print(friendlyWelcome)
print()


let maxUInt8: UInt8 = 255 //  max 255
let minUInt8: UInt8 = 0   // min 0
print(maxUInt8, minUInt8, separator: "...")

let maxInt8: Int8 = 127 // max 127
let minInt8: Int8 = -128 // min -128 
print(maxInt8, minInt8, separator: " ... ")

let maxUInt16: UInt16 = 65535 // max 65535
let minUInt16: UInt16 = 0    // min 0
print(maxUInt16, minUInt16, separator: " ... ")

let maxInt16: Int16 = 32767 // max 32767
let minInt16: Int16 = -32768 // min -32768
print(maxInt16, minInt16, separator: " ... ")
print()

// Integer Conversion 
// calls UInt16(one) to create a new UInt16 initialized with the value of one,
// and uses this value in place of the original. Because both sides of the addition are now of type UInt16,
// the addition is allowed.The output constant (twoThousandAndOne) is inferred to be of type UInt16,
// because it’s the sum of two UInt16 values. = 2001

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
print("Integer-Conversion: \(twoThousandAndOne)")
print()

// Integer and Floating-Point Conversion
// Conversions between integer and floating-point numeric types must be made explicit:
// pi equals 3.14159, and is inferred to be of type Double
// Here, the value of the constant three is used to create a new value of type Double, 
// so that both sides of the addition are of the same type

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pis = Double(three) + pointOneFourOneFiveNine
print("Int to Float-Conversion: \(pis)")
print()

// Floating-point to integer conversion must also be made explicit. 
// Floating-point values are always truncated when used to initialize a new integer value in this way.
// This means that 4.75 becomes 4, and -3.9 becomes -3
// An integer type can be initialized with a Double or Float value:
// integerPi equals 3, and is inferred to be of type Int
let conPi = 3.14159
let integerPi = Int(pi)
print("Floating to int-Conversion: \(integerPi)")
print()

// Type aliases are useful when you want to refer to an existing type by a name that’s contextually more appropriate,
// such as when working with data of a specific size from an external source:
typealias AudioSample = UInt16
// Once you define a type alias, you can use the alias anywhere you might use the original name:
// Here, AudioSample is defined as an alias for UInt16. Because it’s an alias,
// the call to AudioSample.min actually calls UInt16.min, which provides an initial value of 0 for the maxAmplitudeFound variable.
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0
print("maxAmplitudeFound: \(maxAmplitudeFound)")
print()

// Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."
if orangesAreOrange {
   print("Mmm, tasty oranges!")

}else { 
   print("Eww, oranges are horrible.")
}


