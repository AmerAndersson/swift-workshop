
 /**
* =====================================================================================
* * Handle a missing value of optionals
* An optional is a value that may or may not have a value.
* You can create an optional value with the `nil` constant:
* You can unwrap the optional to access that value.
* To write an optional type, you write a question mark (?) after the name of the type that the optional contains
* the type of an optional Int is Int?. An optional Int always contains either some Int value or no value at all. 
* It can’t contain anything else, like a Bool or String value
* ========================================================================================
*/

var serverResponseCode: Int? = 404 // default value
// serverResponseCode contains an actual Int value of 40
// set an optional variable to a valueless state by assigning it the special value nil:
serverResponseCode = nil
// serverResponseCode now contains no value

if serverResponseCode == nil{
   print("convertedNumber not contains some integer value.")
} 
print("-----------------------------------------")


// If you define an optional variable without providing a default value, 
// the variable is automatically set to nil:
var surveyAnswer: String?

if surveyAnswer == nil{
     print("surveyAnswer is automatically \(surveyAnswer ?? "(set to Nil)")!")
}
// surveyAnswer is automatically set to nil

// The string "123" can be converted into the numeric value 123,
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// The type of convertedNumber is "optional Int"  and it returns an optional Int?

// You can use an if statement to find out whether an 
// optional contains a value by comparing the optional against nil.
// You perform this comparison with the “equal to” operator (==) or the “not equal to” operator (!=).
// If an optional has a value, it’s considered as “not equal to” nil:


if convertedNumber != nil {
    // force unwrap an optional value
    print("convertedNumber contains some integer \(convertedNumber!) value.")
}
// Prints "convertedNumber contains some integer value."
print()

// * Optional Binding 
// You use optional binding to find out whether an optional contains a value, and if so, 
// to make that value available as a temporary constant or variable. Optional binding can be used with if, guard, 
// and while statements to check for a value inside an optional, and to extract that value into a constant or variable, 
// as part of a single action. Write an optional binding for an if statement as follows:

// unwrap an optional value
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"
print()

/**
* “If the optional Int returned by Int(possibleNumber) contains a value,
* set a new constant called actualNumber to the value contained in the optional.”
* If the conversion is successful, the actualNumber constant becomes available for use within the first branch of the if statement. 
* It has already been initialized with the value contained within the optional, and has the corresponding non-optional type. In this * * case, the type of possibleNumber is Int?, so the type of actualNumber is Int.
*/

/** 
* If you don’t need to refer to the original,
* optional constant or variable after accessing the value it contains, 
* you can use the same name for the new constant or variable
* This code starts by checking whether myNumber contains a value, just like the code in the previous example. 
* If myNumber has a value, the value of a new constant named myNumber is set to that value. 
* Inside the body of the if statement, writing myNumber refers to that new non-optional constant.
* Writing myNumber before or after the if statement refers to the original optional integer constant.
* 
* Because this kind of code is so common, you can use a shorter spelling to unwrap an optional value:
* Write just the name of the constant or variable that you’re unwrapping. 
* The new, unwrapped constant or variable implicitly uses the same name as the optional value.
*/
let myNumber = Int(possibleNumber) // unwrap an optional value
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number1 is \(myNumber)")
}
// Prints "My number is 123"

if let myNumber {
    print("My number2 is \(myNumber)")
}
// Prints "My number is 123"
print()

/**
* You can include as many optional bindings and Boolean conditions in a single if statement as you need to, 
* separated by commas. If any of the values in the optional bindings are nil or any Boolean condition evaluates to false,
* the whole if statement’s condition is considered to be false
*/
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"


if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"
print()

/**
* * Providing a Fallback Value: default value using the nil-coalescing operator (??).
* Another way to handle a missing value is to supply a default value using the nil-coalescing operator (??). 
* If the optional on the left of the ?? isn’t nil, that value is unwrapped and used. Otherwise, the value on the right of ?? is used. 
* For example, the code below greets someone by name if one is specified, and uses a generic greeting when the name is nil.
*/
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)
// Prints "Hello, friend!"

let names: String? = "There"
let myName = "Amer"
let greetings = "Hello, \(name ?? myName)!"
print(greetings) // Prints "Hello, There!"


let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)!"
print(informalGreeting) // Prints "Hi John Appleseed"
print()


/**
* * Force Unwrapping exclamation mark (!)
* When nil represents an unrecoverable failure, such as a programmer error or corrupted state, 
* you can access the underlying value by adding an exclamation mark (!) to the end of the optional’s name. 
* This is known as force unwrapping the optional’s value. When you force unwrap a non-nil value, the result is its unwrapped value.
* Force unwrapping a nil value triggers a runtime error.
* The ! is, effectively, a shorter spelling of fatalError(_:file:line:). For example, the code below shows two equivalent approaches:
*/

let possibleNumbers = "123"
let convertedNumbers = Int(possibleNumbers)

let numbers = convertedNumbers!

guard let numbers = convertedNumbers else {
  fatalError("The number was invalid")
}
print() 

/**
* * Implicitly Unwrapped Optionals
* As described above, optionals indicate that a constant or variable is allowed to have “no value”. 
* Optionals can be checked with an if statement to see if a value exists, and can be conditionally 
* unwrapped with optional binding to access the optional’s value if it does exist.

* Sometimes it’s clear from a program’s structure that an optional will always have a value, after that value is first set.
* In these cases, it’s useful to remove the need to check and unwrap the optional’s value every time it’s accessed, because it 
* can be safely assumed to have a value all of the time.

* These kinds of optionals are defined as implicitly unwrapped optionals. You write an implicitly unwrapped optional 
* by placing an exclamation point (String!) rather than a question mark (String?) after the type that you want to make optional.
* Rather than placing an exclamation point after the optional’s name when you use it, you place an exclamation point after the optional’s 
* type when you declare it.

* Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional 
* is first defined and can definitely be assumed to exist at every point thereafter. The primary use of implicitly unwrapped optionals 
* in Swift is during class initialization, * as described in Unowned References and Implicitly Unwrapped Optional Properties.

* Don’t use an implicitly unwrapped optional when there’s a possibility of a variable becoming nil at a later point.
* Always use a normal optional type if you need to check for a nil value during the lifetime of a variable.

* An implicitly unwrapped optional is a normal optional behind the scenes, but can also be used like a non-optional value, 
* without the need to unwrap the optional value each time it’s accessed. The following example shows the difference in behavior 
* between an optional string and an implicitly unwrapped optional string when accessing their wrapped value as an explicit String:
*/

let possibleString: String? = "An optional string"
let forcedString: String = possibleString!  // Requires explicit unwrapping

if let forcedS = possibleString{
  print(forcedS)
}
print()

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // Unwrapped automatically, implicitString has an explicit, non-optional type of String.

// You can check whether an implicitly unwrapped optional is nil the same way you check a normal optional:
if assumedString != nil {
    print(assumedString!) // Prints "An implicitly unwrapped optional string.
}

// You can also use an implicitly unwrapped optional with optional binding, 
// to check and unwrap its value in a single statement:
if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."
print("---------------------------------------")


/**
* You can think of an implicitly unwrapped optional as giving permission for the optional to be force-unwrapped if needed.
* When you use an implicitly unwrapped optional value, Swift first tries to use it as an ordinary optional value; 
* if it can’t be used as an optional, Swift force-unwraps the value. In the code above,
* the optional value assumedString is force-unwrapped before assigning its value to implicitString
* because implicitString has an explicit, non-optional type of String. 
* Prints "An implicitly unwrapped optional string."
* If an implicitly unwrapped optional is nil and you try to access its wrapped value, 
* you’ll trigger a runtime error. The result is exactly the same as if you write 
* an exclamation point to force unwrap a normal optional that doesn’t contain a value.
*/

// optionalString doesn’t have an explicit type so it’s an ordinary optional.
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.
let optionalString = assumedString

// You can check whether an implicitly unwrapped optional is nil the same way you check a normal optional:
if assumedString != nil {
    print(assumedString!)
}
// You can also use an implicitly unwrapped optional with optional binding, to check and unwrap its value in a single statement:
if let definiteString = assumedString {
    print(definiteString)
}

/// Optional
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)
print()

// Another way to handle optional values is to provide a default value using the ?? operator. 
// If the optional value is missing, the default value is used instead.
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)

if let nickname {
    print("Hey, \(nickname)")
}else{
  print("Hello, \(fullName)")
}
// Doesn't print anything, because nickname is nil.
print()
