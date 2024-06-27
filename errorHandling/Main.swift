// Error handling to respond to error conditions your program may encounter during execution
// How error handling can be used to respond to different error conditions:
/*
func makeASandwich() throws {
    // ...
}


do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
*/

/**
* *Assertions and Preconditions
* Assertions and preconditions are checks that happen at runtime. 
* You use them to make sure an essential condition is satisfied before executing any further code.
* If the Boolean condition in the assertion or precondition evaluates to true, code execution continues as usual. 
* If the condition evaluates to false, the current state of the program is invalid; code execution ends, and your app is terminated.
* Assertions and preconditions can be used to ensure that the code you are writing is correct, and
* assertions help you find mistakes and incorrect assumptions during development, and preconditions help you detect issues in production
*/
 
// *Debugging with
// You write an assertion by calling the assert(_:_:file:line:)  and assertionFailure(_:file:line:) function from the Swift standard library. 
// You pass this function an expression that evaluates to true or false and a message to display if the result of the condition is false. 
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 isn't >= 0.

var age = -3

assert(age >= 0)

// checks the condition to indicate that an assertion has failed
// This assertion fails because -3 isn't >= 0.
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
// Enforcing Preconditions
// You write a precondition by calling the precondition(_:_:file:line:) function from the Swift standard library. 
// You pass this function an expression that evaluates to true or false and a message to display if the result of the condition is false.
var index = 3
// In the implementation of a subscript...
precondition(index > 0, "Index must be greater than zero.")


if index > 10 {
  print("You can ride the roller-coaster or the ferris wheel.")
} else if index >= 0 {
  print("You can ride the ferris wheel.")
} else {
  precondition(index > 0, "Index must be greater than zero.")
}

fatalError("Unimplemented")

//  preconditionFailure(_:file:line:) function to indicate that a failure has occurred , 
// if the default case of a switch was taken, but all valid input data should have been handled by one of the switch’s other cases.
if index > 10 {
  print("You can ride the roller-coaster or the ferris wheel.")
} else if index >= 0 {
  print("You can ride the ferris wheel.")
} else {
 preconditionFailure(index > 0, "Index must be greater than zero.")
}

fatalError("Unimplemented")