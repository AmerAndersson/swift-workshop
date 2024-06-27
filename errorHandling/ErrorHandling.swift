/**
Error handling is the process of responding to and recovering from error conditions in your program.
Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.

Consider the task of reading and processing data from a file on disk. 
There are a number of ways this task can fail, including the file not existing at the specified path,
the file not having read permissions, or the file not being encoded in a compatible format.
Distinguishing among these different situations allows a program to resolve some errors 
and to communicate to the user any errors it can’t resolve.

** Representing and Throwing Errors

In Swift, errors are represented by values of types that conform to the Error protocol.
This empty protocol indicates that a type can be used for error handling.

Swift enumerations are particularly well suited to modeling a group of related error conditions,
with associated values allowing for additional information about the nature of an error to be communicated. 
Here’s how you might represent the error conditions of operating a vending machine inside a game:

Throwing an error lets you indicate that something 
unexpected happened and the normal flow of execution can’t continue.
Use a throw statement to throw an error.

** Propagating Errors Using Throwing Functions
To indicate that a function, method, or initializer can throw an error, 
you write the throws keyword in the function’s declaration after its parameters. 
A function marked with throws is called a throwing function. 
If the function specifies a return type, you write the throws keyword before the return arrow (->).
A throwing function propagates errors that are thrown inside of it to the scope from which it’s called.
** Note
Only throwing functions can propagate errors. Any errors thrown inside a nonthrowing function must be handled inside the function.
*/

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
// The following code throws an error to indicate that five additional coins are needed by the vending machine:
// The VendingMachine class has a vend(itemNamed:) method that throws an appropriate VendingMachineError
// if the requested item isn’t available, is out of stock, or has a cost that exceeds the current deposited amount:
// ** Propagating Errors Using Throwing Functions

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

/**
The implementation of the vend(itemNamed:) method uses guard statements to exit the method early 
and throw appropriate errors if any of the requirements for purchasing a snack aren’t met. 
Because a throw statement immediately transfers program control, 
an item will be vended only if all of these requirements are met.

Because the vend(itemNamed:) method propagates any errors it throws, 
any code that calls this method must either handle the errors — using a do-catch statement, try?, or try! — 
or continue to propagate them.
*/

// The buyFavoriteSnack(person:vendingMachine:) in the example below is also a throwing function,
// and any errors that the vend(itemNamed:) method throws will propagate up to the point where 
// the buyFavoriteSnack(person:vendingMachine:) function is called

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
/**
The buyFavoriteSnack(person: vendingMachine:) function looks up a given person’s favorite snack
and tries to buy it for them by calling the vend(itemNamed:) method. 
Because the vend(itemNamed:) method can throw an error, it’s called with the try keyword in front of it.
*/

/**
Throwing initializers can propagate errors in the same way as throwing functions. 
The initializer for the PurchasedSnack structure in the listing below calls a 
throwing function as part of the initialization process, 
and it handles any errors that it encounters by propagating them to its caller.
*/
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

// Handling Errors Using Do-Catch
// The following code matches against all three cases of the VendingMachineError enumeration.
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}
// Prints "Insufficient funds. Please insert an additional 2 coins."

// The above code can be written so any error that isn’t a 
// VendingMachineError is instead caught by the calling function:
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}


do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
// Prints "Couldn't buy that from the vending machine."

// In the nourish(with:) function, if vend(itemNamed:) 
// throws an error that’s one of the cases of the VendingMachineError enumeration, nourish(with:) 
// handles the error by printing a message. Otherwise, nourish(with:) propagates the error to its call site.
// The error is then caught by the general catch clause.

// Another way to catch several related errors is to list them after catch, separated by commas. 
func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

/**
The eat(item:) function lists the vending machine errors to catch, and its error text corresponds to the items in that list. 
If any of the three listed errors are thrown, this catch clause handles them by printing a message. 
Any other errors are propagated to the surrounding scope, including any vending-machine errors that might be added later.
*/
print("---------------------------------------------")

/**
** Converting Errors to Optional Values
You use try? to handle an error by converting it to an optional value. 
If an error is thrown while evaluating the try? expression, the value of the expression is nil. 
In the following code x and y have the same value and behavior:

If someThrowingFunction() throws an error, the value of x and y is nil. Otherwise,
the value of x and y is the value that the function returned. 
Note that x and y are an optional of whatever type someThrowingFunction() returns. 
Here the function returns an integer, so x and y are optional integers.
The function returns an integer, so x and y are optional integers
*/
func someThrowingFunction() throws -> Int {
 
  return 1

}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

// Using try? lets you write concise error handling code when you want to handle all errors in the same way.
// The following code uses several approaches to fetch data, or returns nil if all of the approaches fail
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}

/**
** Disabling Error Propagation
You can write try! before the expression to disable error propagation and wrap 
the call in a runtime assertion that no error will be thrown. If an error actually is thrown, you’ll get a runtime error.

The following code uses a loadImage(atPath:) function, which loads the image resource at a given path or throws an error if the image can’t be loaded. In this case, because the image is shipped with the application, no error will be thrown at runtime, so it’s appropriate to disable error propagation.
*/
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

/**
** Specifying Cleanup Actions
You use a defer statement to execute a set of statements just before code execution leaves the current block of code. This statement lets you do any necessary cleanup that should be performed regardless of how execution leaves the current block of code — whether it leaves because an error was thrown or because of a statement such as return or break. For example, you can use a defer statement to ensure that file descriptors are closed and manually allocated memory is freed.

A defer statement defers execution until the current scope is exited. This statement consists of the defer keyword and the statements to be executed later. The deferred statements may not contain any code that would transfer control out of the statements, such as a break or a return statement, or by throwing an error. Deferred actions are executed in the reverse of the order that they’re written in your source code. That is, the code in the first defer statement executes last, the code in the second defer statement executes second to last, and so on. The last defer statement in source code order executes first.
*/
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        //close(file) is called here, at the end of the scope.
    }
}

// The above example uses a defer statement to ensure that the open(_:) function has a corresponding call to close(_:).
// You can use a defer statement even when no error handling code is involved. 