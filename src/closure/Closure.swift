/**
Closures is group of code that executes together, without creating a named function.
Closures are self-contained blocks of functionality that can be passed around and used in your code. 
Closures in Swift are similar to closures, (anonymous functions, lambdas, and blocks in other programming languages). Closures can capture and store references to any constants and variables from the context in which they’re defined. This is known as closing over those constants and variables. 
Swift handles all of the memory management of capturing for you.
*/

/**
The sorted(by:) method accepts a closure that takes two arguments of the same type as the array’s contents, and returns a Bool value to say whether the first value should appear before or after the second value once the values are sorted. The sorting closure needs to return true if the first value should appear before the second value, and false otherwise.

sorting an array of String values, 
and so the sorting closure needs to be a function of type (String, String) -> Bool.

One way to provide the sorting closure is to write a normal function of the correct type, and to pass it in as an argument to the sorted(by:) method
*/

// The closure expression examples below use the sorted(by:) method 
// to sort an array of String values in reverse alphabetical order.
// Here’s the initial array to be sorted
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
for reverseSorted in reversedNames {
    print(reverseSorted, terminator: ", ")
}
print("")
print("-----------------------")

// Write the sorting closure inline, using closure expression syntax
// version of the backward(_:_:) function
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2})
for reverseSorted2 in reversedNames {
    print(reverseSorted2, terminator: ", ")
}
print("")
print("-----------------------")

// Inferring Type From Context inline closure expression
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
for reverseSorted3 in reversedNames {
   print(reverseSorted3, terminator: ", ")
}
print("")
print("-----------------------")

// Implicit Returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
for reverseSorted4 in reversedNames {
   print(reverseSorted4, terminator: ", ")
}
print("")
print("-----------------------")

// Shorthand Argument Names
// Swift automatically provides shorthand argument names to inline closures, 
// which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2.
reversedNames = names.sorted(by: { $0 > $1 } )
for reverseSorted5 in reversedNames {
   print(reverseSorted5, terminator: ", ")
}
print("")
print("-----------------------")

// The string-sorting closure from the Closure Expression Syntax section above
// can be written outside of the sorted(by:) method’s parentheses as a trailing closure:
reversedNames = names.sorted() { $0 > $1 }
for reverseSorted7 in reversedNames {
   print(reverseSorted7, terminator: ", ")
}
print("")
print("-----------------------")

// If a closure expression is provided as the function’s 
// or method’s only argument and you provide that expression as a trailing closure, 
// you don’t need to write a pair of parentheses () after the function 
// or method’s name when you call the function:
reversedNames = names.sorted { $0 > $1 }
for reverseSorted8 in reversedNames {
   print(reverseSorted8, terminator: ", ")
}
print("")
print("-----------------------")

// Operator Methods
reversedNames = names.sorted(by: >)
for reverseSorted6 in reversedNames {
   print(reverseSorted6, terminator: ", ")
}
print("")
print("-----------------------")

// A function that performs an operation on an array of integers.
// We’ll use a trailing closure to define the operation.
func performOperationOnArray(_ numbers: [Int], operation: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    for number in numbers {
        let transformedNumber = operation(number)
        result.append(transformedNumber)
    }
    return result
}

let inputNumbers = [1, 2, 3, 4, 5]

// Using a trailing closure
let doubledNumbers = performOperationOnArray(inputNumbers) { number in
    return number * 2
}
print("Doubled numbers: \(doubledNumbers)")
print("-----------------------")

// Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // Function body goes here
    print("Executing function body")
    closure()
}

// Calling the function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // Closure's body goes here
    print("Executing closure body")
})

// Calling the function with a trailing closure instead:
someFunctionThatTakesAClosure {
    // Trailing closure's body goes here
    print("Executing trailing closure body")
}
print("-----------------------")

// The map(_:) method with a trailing closure to convert an array of Int values
// into an array of String values. The array [16, 58, 510] is used to create the

// The string retrieved from the digitNames dictionary is added to the front of output, 
// effectively building a string version of the number in reverse. 
// (The expression number % 10 gives a value of 6 for 16, 8 for 58, and 0 for 510.)
// The number variable is then divided by 10. 
// Because it’s an integer, it’s rounded down during the division, so 16 becomes 1, 58 becomes 5, and 510 becomes 51.
// The process is repeated until number is equal to 0, at which point the output string is returned by the closure,
//  and is added to the output array by the map(_:) method.
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]
print(strings)
print("-----------------------")

// Capturing Values
// The simplest form of a closure that can capture values is a nested function,
// written within the body of another function. A nested function can capture 
// any of its outer function’s arguments and can also capture any constants 
// and variables defined within the outer function.

// A function called makeIncrementer, which contains a nested function called incrementer.
// The nested incrementer() function captures two values, runningTotal and amount, from its surrounding context.
// After capturing these values, incrementer is returned by makeIncrementer as a closure that increments runningTotal 
// by amount each time it’s called.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// This example sets a constant called incrementByTen 
// to refer to an incrementer function that adds 10 
// to its runningTotal variable each time it’s called. 
// Calling the function multiple times shows this behavior in action:
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen()) // returns a value of 10
print(incrementByTen()) // returns a value of 20
print(incrementByTen()) // returns a value of 30
print(incrementByTen()) // returns a value of 40
print("-----------------------")
// If you create a second incrementer, it will have its own stored reference to a new, separate runningTotal variable:
let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven()) // returns a value of 7
print(incrementBySeven()) // returns a value of 14
print(incrementBySeven()) // returns a value of 21
print(incrementBySeven()) // returns a value of 28
print("-----------------------")

// Closures Are Reference Types
// This also means that if you assign a closure to two different constants or variables,
// both of those constants or variables refer to the same closure.
// Show that calling alsoIncrementByTen is the same as calling incrementByTen. 
// Because both of them refer to the same closure, they both increment and return the same running total.
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
// returns a value of 50
print(incrementByTen())
// returns a value of 60
print("-----------------------")

// Escaping Closures
// The closure passed to someFunctionWithEscapingClosure(_:) refers to self explicitly. 
// In contrast, the closure passed to someFunctionWithNonescapingClosure(_:)
// is a nonescaping closure, which means it can refer to self implicitly.
//  include self in the closure’s capture list

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}


func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

/// Captures self, refers to self explicitly.
/// and then refers to self implicitly.
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()

instance.doSomething()
// Nonescaping Closures
print(instance.x) 
// Prints "200"

// Escaping Closures
completionHandlers.first?()
print(instance.x)
// Prints "100"
print("-----------------------")

/// captures self by including it in the closure’s capture list,
/// and then refers to self implicitly
class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance2 = SomeOtherClass()

instance2.doSomething()
// Nonescaping Closures
print(instance2.x)
// Prints "200"

// Escaping Closures
completionHandlers.first?()
print(instance2.x)
// Prints "100"
print("-----------------------")


// An autoclosure lets you delay evaluation
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count) // delay evaluation
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

// You get the same behavior of delayed evaluation 
// when you pass a closure as an argument to a function.
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!
print(customersInLine.count)
// The serve(customer:) function in the listing 
// above takes an explicit closure that returns a customer’s name.


// The version of serve(customer:) below performs the same operation but,
// instead of taking an explicit closure, it takes an autoclosure by
// marking its parameter’s type with the @autoclosure attribute. 
// Now you can call the function as if it took a String argument instead of a closure.
// The argument is automatically converted to a closure, 
// because the customerProvider parameter’s type is marked with the @autoclosure attribute.

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"
print(customersInLine.count)
print("-----------------------")

// An autoclosure lets you delay evaluation
func printResult(_ closure: @autoclosure () -> Int) {
    print("Result: \(closure())")
}

let value = 42
printResult(value * 2) // Prints "Result: 84"
print("-----------------------")

// Combining Autoclosure and Escaping:
// If you want an autoclosure that’s allowed to escape,
// use both the @autoclosure and @escaping attributes
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))


print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"
print("Collected \(customersInLine.count) closures.")