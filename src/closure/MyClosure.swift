/**
A closure is a self-contained block of code that can be assigned to a variable,
passed as an argument to functions, or returned from functions.

Closures capture and store references to the variables and constants from their surrounding context,
allowing them to be executed later.

Closures in Swift have the following basic syntax
{ (parameters) -> ReturnType in
    // Code block
}
Closures are powerful tools in Swift, allowing you to write concise and expressive code. 
They are commonly used for asynchronous operations, functional programming, and more
*/


// Anonymous Function (Closure)
let greet = { (name: String) -> String in
    return "Hello, \(name)!"
}
print(greet("Alice")) // Output: "Hello, Alice!"
print("--------------------------")

// Trailing Closure Syntax:
func performAction(completion: () -> Void) {
    // Some work here
    completion()
}
performAction {
    print("Action completed!")
}
print("--------------------------")

// Common Use Cases: Sorting
let numbers = [5, 2, 8, 1, 3]
let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)
print("--------------------------")

// Map and Filter:
let names = ["Alice", "Bob", "Charlie"]
let uppercaseNames = names.map { $0.uppercased() }
let filteredNames = names.filter { $0.count > 4 }
print(uppercaseNames)
print(filteredNames)
print("--------------------------")

//Capturing Values:
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}
let incrementByTwo = makeIncrementer(incrementAmount: 2)
print(incrementByTwo()) // Output: 2
print(incrementByTwo()) // Output: 4
print("--------------------------")

// Capture Lists:
// Closures capture values from their surrounding context.
// To avoid strong reference cycles, you can use capture lists:
class Person {
    let name: String
    init(name: String) { self.name = name }
    lazy var sayHello: () -> String = { [weak self] in
        return "Hello, \(self?.name ?? "Unknown")!"
    }
}
let person = Person(name: "Alice")
print(person.sayHello()) // Output: "Hello, Alice!"
print("--------------------------")

/**
** An escaping closure** is a closure that outlives the function or scope in which it is defined.
- When you pass an escaping closure as an argument to a function, the closure can be stored beyond the lifetime of that function.
- Common use cases for escaping closures include asynchronous operations (e.g., network requests, animations) and completion handlers.
- To declare an escaping closure, use the `@escaping` attribute before the closure type in the function signature.
func performAsyncTask(completion: @escaping () -> Void) {
         DispatchQueue.global().async {
             // Simulate an async task
             // ...
     completion() // Call the escaping closure
    }
}
performAsyncTask {
    print("Task completed!")
}
print("--------------------------")
*/


/**
* * Non-Escaping Closures**:
- A non-escaping closure is a closure that is executed within the same function or scope where it is defined.
- Non-escaping closures are typically used synchronously and do not outlive the function.
- By default, closures are non-escaping unless explicitly marked as escaping.
- Non-escaping closures are more memory-efficient because they don't need to be retained beyond their immediate context.
*/
func processItems(using closure: (Int) -> Void) {
         for i in 1...5 {
        closure(i) // Execute the non-escaping closure
    }
 }
 processItems { item in
    print(item)
 }
 print("--------------------------")
/**
 ** Definition**:
- Function:
- A function is a named block of code that performs a specific task.
- Functions can be defined globally or within a class, struct, or enum.
- They have a name, parameters, and a return type.
- Closure:
- A closure is an anonymous (unnamed) block of code that can be assigned to a variable or passed as an argument to functions.
- Closures capture and store references to variables and constants from their surrounding context.
*/

// Function:
func greet(name: String) -> String {
    return "Hello, \(name)!"
}
print(greet("Alice")) // Output: "Hello, Alice!"
print("--------------------------")
  
// Closure:
let greetClosure: (String) -> String = { name in
    return "Hello, \(name)!"
}
print(greetClosure("Alice")) // Output: "Hello, Alice!"
print("--------------------------")

// Function vs. Closure Example:
func add(a: Int, b: Int) -> Int {
    return a + b
}
let result = add(a: 3, b: 5) // Calling the function
print(result) // Output: 8
print("--------------------------")
    
// Closure: 
let addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}
let resultClosure = addClosure(3, 5) // Calling the closure
print(resultClosure) // Output: 8
print("--------------------------")
