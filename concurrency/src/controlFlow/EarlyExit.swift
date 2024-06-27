// Early Exit
// A guard statement, like an if statement, 
// executes statements depending on the Boolean value of an expression. 
// You use a guard statement to require that a condition must be true 
// in order for the code after the guard statement to be executed. 
// Unlike an if statement, a guard statement always has an else clause 
// — the code inside the else clause is executed if the condition isn’t true.
// Control statement: return, break, continue, or throw
func greet(person: [String: String]) {
    guard let name = person["name"] else { return }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }


    print("I hope the weather is nice in \(location).")
}


greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."
greet(person: ["name": "Amer", "location": "Sweden"])
print("--------------")
// Prints "Hello Amer!" 
// Prints "I hope the weather is nice in Sweden."

// Guard statements are most useful when you want to require that a condition be true 
// in order for the code after the guard statement to be executed. 
// If the condition isn’t true, the code after the guard statement isn’t executed

// Deferred Actions
// Unlike control-flow constructs like if and while, 
// which let you control whether part of your code is executed or how many times it gets executed,
// defer controls when a piece of code is executed. 
// You use a defer block to write code that will be executed later,
// when your program reaches the end of the current scope.

var score = 1
if score < 10 {
    defer {
        print("Score: \(score)")
    }
    score += 5
}
print("--------------")

// the following code gives a temporary bonus to the score, 
// by adding and subtracting 100 inside a chunk of code:
var score1 = 3
if score1 < 100 {
    score1 *= 5
    defer {
        score1 -= 100
    }
    // Other code that uses the score with its bonus goes here.
    print(score1)
}
// Prints "103" 
print("--------------")

// If you write more than one defer block in the same scope, 
// the first one you specify is the last one to run.
if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
    score += 5
}
// Prints "The score is:"
// Prints "6"
print("--------------")

/**
* * Checking API Availability
Swift has built-in support for checking API availability, which ensures that you don’t accidentally use APIs that are unavailable on a given deployment target.

The compiler uses availability information in the SDK to verify that all of the APIs used in your code are available on the deployment target specified by your project. Swift reports an error at compile time if you try to use an API that isn’t available.

You use an availability condition in an if or guard statement to conditionally execute a block of code, depending on whether the APIs you want to use are available at runtime. The compiler uses the information from the availability condition when it verifies that the APIs in that block of code are available.
*/

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
    // Fall back to earlier iOS and macOS APIs
}

/**
The availability condition above specifies that in iOS, the body of the if statement executes only in iOS 10 and later; in macOS, only in macOS 10.12 and later. The last argument, *, is required and specifies that on any other platform, the body of the if executes on the minimum deployment target specified by your target.

In its general form, the availability condition takes a list of platform names and versions. You use platform names such as iOS, macOS, watchOS, and tvOS — for the full list, see Declaration Attributes. In addition to specifying major version numbers like iOS 8 or macOS 10.10, you can specify minor versions numbers like iOS 11.2.6 and macOS 10.13.3.

if #available(<#platform name#> <#version#>, <#...#>, *) {
    <#statements to execute if the APIs are available#>
} else {
    <#fallback statements to execute if the APIs are unavailable#>
}
*/

// When you use an availability condition with a guard statement, 
// it refines the availability information that’s used for the rest of the code in that code block.
@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
       return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}
print(chooseBestColor())
/**
the ColorPreference structure requires macOS 10.12 or later. 
The chooseBestColor() function begins with an availability guard. 
If the platform version is too old to use ColorPreference, 
it falls back to behavior that’s always available. After the guard statement,
you can use APIs that require macOS 10.12 or later.
*/

/**
In addition to #available, Swift also supports the opposite check using an unavailability condition. 
The following two checks do the same thing:
*/
if #available(iOS 10, *) {
} else {
    // Fallback code
}

if #unavailable(iOS 10) {   
}else {
  // Fallback code
}
// Using the #unavailable form helps make your code more readable when the check contains only fallback code.