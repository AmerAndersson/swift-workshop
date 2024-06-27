/// Adding a Closure as a Target to UIButton: 
/// Suppose you want to add a closure as a target to a
/// UIButton or other controls in Swift.
/// In this example, the handler argument is a closure that takes an action parameter and returns Void.
/// When the button is tapped, it prints out the
let button = UIButton(type: .system, primaryAction: UIAction(title: "Button Title", handler: { action in
    print("Button with title \(action.title) tapped!")
}))

/// Returning a Closure from a Function: You can also return closures from functions.
/// consider a function that returns a closure which takes a string argument and prints a message:
func travel() -> (String) -> Void {
    return { place in
        print("I'm going to \(place)")
    }
}

// Usage:
let result = travel()
result("London")

/// The travel() function returns a closure that accepts a string argument. When you call result("London")

let numbers = [5, 2, 8, 1, 3]
let sortedNumbers = numbers.sorted { $0 < $1 }
/// the closure { $0 < $1 } compares two elements and returns a Bool 
/// indicating whether the first element is less than the second.
