
// Function greet(person:), it takes a person’s name as input
// and returns a greeting for that person and a return type of String:
func greet(person: String) -> String {
  let greeting = ("Hello \(person)!")
  return greeting
}
print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"
print("---------------------------")

// Combine the message creation 
// and the return statement into one line:
func greetAgain(person: String) -> String {
    return ("Hello again, \(person)!")
}
print(greetAgain(person: "Anna"))
// Prints "Hello again, Anna!"
print(greetAgain(person: "Smith"))
// Prints "Hello again, Smith!"
print("---------------------------")

// Functions With Multiple Parameters
// This function takes a person’s name 
// and whether they have already been greeted as input, 
// and returns an appropriate greeting for that person:
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!"
print("---------------------------")

// Functions Without Return Values
// Functions aren’t required to define a return type. -> Void 
// A version of the greet(person:) function, which prints its own String value rather than returning it:
func greets(person: String) {
    print("Hello, \(person)!")
}
greets(person: "Dave")
// Prints "Hello, Dave!"
print("---------------------------")

// The return value of a function can be ignored when it’s called:
func printAndCount(string: String) -> Int {
    print("\(string)")
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
print(printAndCount(string: "Hello, World"))
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "Hello, World")
// prints "hello, world" but doesn't return a value
print("---------------------------")

/*
 Functions with Multiple Return Values, use a tuple type as the return type
for a function to return multiple values as part of one compound return value.
Define a function called minMax(array:), which finds the smallest and largest 
numbers in an array of Int values:

The minMax(array:) function above returns a tuple containing two Int values. However, the function doesn’t perform any safety checks on the array it’s passed. If the array argument contains an empty array, the minMax(array:) function, as defined above, will trigger a runtime error when attempting to access array[0].
*/
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
print("---------------------------")

// Optional Tuple Return Types (Int, Int)? or (String, Int, Bool)?.
// To handle an empty array safely, write the minMax(array:)
// function with an optional tuple return type and return a value of nil when the array is empty:
func minAndMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }

    }
    return (currentMin, currentMax)
}

// use optional binding to check whether this version of the minMax(array:)
// function returns an actual tuple value or nil:
if let bounds = minAndMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}// Prints "min is -6 and max is 109"
print("---------------------------")

// Function Argument Labels and Parameter Names: Specifying Argument Labels. 
// Write an argument label before the parameter name, separated by a space:
// greets(person:) function that takes a person’s name and hometown and returns a greeting:
func greets(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greets(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."
print("---------------------------")

// Omitting Argument Labels
// If you don’t want an argument label for a parameter, 
// write an underscore (_) instead of an explicit argument label for that parameter.
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
   print("The sum is \(firstParameterName + secondParameterName)")
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(10, secondParameterName: 20)
// If a parameter has an argument label, the argument must be labeled when you call the function.
print("---------------------------")

// Default Parameter Values 
// Define a default value for any parameter in a function by assigning a value to the parameter 
// after that parameter’s type. If a default value is defined, 
// you can omit that parameter when calling the function.
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
   print("The sum is \(parameterWithDefault + parameterWithoutDefault)")
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
print("---------------------------")

// Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type. 
// use a variadic parameter to specify that the parameter can be passed a varying number of input values 
// when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.

// calculates the arithmetic mean (also known as the average) for a list of numbers of any length:
// A variadic parameter with a name of numbers and a type of Double... 
// is made available within the function’s body as a constant array called numbers of type [Double]

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print("Average is \(arithmeticMean(1, 2, 3, 4, 5))")
// returns 3.0, which is the arithmetic mean of these five numbers
print("Average is \(arithmeticMean(3, 8.25, 18.75))")
// returns 10.0, which is the arithmetic mean of these three numbers
print("---------------------------")


// Function parameters are constants by default. (In-Out Parameters)
// swaps the value of b into a, and the value of a into b
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var someInt = 10
var anotherInt = 20
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 20, and anotherInt is now 10"
print("---------------------------")

// A function with no parameters or return value: () -> Void
func printHelloWorld() {
    print("Hello, World!")
}
printHelloWorld()
// Prints "hello, world"

// A function with no parameters,but has a return type value:  
func sayHelloWorld() -> String {
    return "Hello, World!"
}
print(sayHelloWorld())
// Prints "hello, world"
print("------------------")

// Function Types
// Every function has a specific function type, made up of the parameter types
// and the return type of the function.
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtractTwoInts(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func divideTwoInts(_ a: Int, _ b: Int) -> Int {
    return a / b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// Using Function Types
// You use function types just like any other types in Swift. 
// You can define a constant or variable to be of a function 
// type and assign an appropriate function to that variable:
var mathFunction: (Int, Int) -> Int = addTwoInts
print("The sum is \(mathFunction(10, 10))")
// Prints "Result: 20"

// A different function with the same matching type can be assigned to the same variable,
// in the same way as for non-function types:
mathFunction = subtractTwoInts
print("The difference is \(mathFunction(10, 5))")
// Prints "Result: 5"
mathFunction = divideTwoInts
print("The quotient is \(mathFunction(90, 10))")
// Prints "Result: 9"
mathFunction = multiplyTwoInts
print("The product is  \(mathFunction(4, 5))")
// Prints "Result: 20"
print("------------------")

// As with any other type, you can leave it to Swift to infer the function type
// when you assign a function to a constant or variable:
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
let anotherMathFunction = addTwoInts
print("The sum is \(anotherMathFunction(10, 10))")
// Prints "Result: 20"
print("------------------")

// Function Types as Parameter 
// You can use a function type such as (Int, Int) -> Int as a parameter type for another function. 
// This enables you to leave some aspects of a function’s implementation for the function’s caller 
// to provide when the function is called.
// print the results of the math functions from above:
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("The sum of a + b is \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 20, 5)
// Prints "Result: 25"
print("------------------")

// Function Types as Return Types
// Defines two simple functions called stepForward(_:) and stepBackward(_:). 
// The stepForward (_:) function returns a value one more than its input value, 
// and the stepBackward(_:) function returns a value one less than its input value.
// Both functions have a type of (Int) -> Int:

func stepForwards(_ input: Int) -> Int {
    return input + 1
}
func stepBackwards(_ input: Int) -> Int {
    return input - 1
}

// A function called chooseStepFunction(backward:), whose return type is (Int) -> Int. 
// The chooseStepFunction(backward:) function returns the stepForward(_:) function
// or the stepBackward(_:) function based on a Boolean parameter called backward:
func chooseStepFunctions(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackwards : stepForwards
}

// Now use chooseStepFunction(backward:) to obtain a function that will step in one direction or the other:

var currentValues = 3
let moveNearerToZeros = chooseStepFunctions(backward: currentValues > 0)
// moveNearerToZero now refers to the stepBackward() function
// The example above determines whether a positive or 
// negative step is needed to move a variable called currentValue progressively closer to zero.
// currentValue has an initial value of 3, which means that currentValue > 0 returns true, 
// causing chooseStepFunction(backward:) to return the stepBackward(_:) function.

// A reference to the returned function is stored in a constant called moveNearerToZero.
print("CurrentValue is \(moveNearerToZeros(currentValues))")
// Now that moveNearerToZero refers to the correct function, it can be used to count to zero:
print("Counting to zero:")
// Counting to zero:
while currentValues != 0 {
    print("\(currentValues)... ")
    currentValues = moveNearerToZeros(currentValues)
}
print("zero!")
print("------------------")


// Nested Functions
// Nested functions are hidden from the outside world by default,
// but can still be called and used by their enclosing function. 
// An enclosing function can also return one of its nested functions 
// to allow the nested function to be used in another scope.
// You can rewrite the chooseStepFunction(backward:) example above to use and return nested functions:
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")