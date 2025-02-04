
// Functions and Closures
// Use func to declare a function. 
// Call a function by following its name with a list of arguments in parentheses.
// Use -> to separate the parameter names and types from the function’s return type
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

let bob = greet(person: "Bob", day: "Tuesday")
print(bob)
print("---------------------")

// By default, functions use their parameter names as labels for their arguments. 
// Write a custom argument label before the parameter name, or write _ to use no argument label.
func greeting(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
let john = greeting("John", on: "Wednesday")
print(john)
print("---------------------")


// Use a tuple to make a compound value — for example, to return multiple values from a function.
// The elements of a tuple can be referred to either by name or by number.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
  var min = scores[0]
  var max = scores[0]
  var sum = 0

  for score in scores {
    if score > max {
      max = score 
    } else if score < min {
      min = score
    }
    sum += score
  }
  return (min, max, sum)

}

let statistics  = calculateStatistics(scores: [5, 3, 100,3, 9])
print("Min is \(statistics.0) Max is \(statistics.1)")
print("Sum is \(statistics.sum) Sum is \(statistics.2)")
print("---------------------------")



// Functions can be nested. Nested functions have access to variables that were declared in the outer function.
// You can use nested functions to organize the code in a function that’s long or complex.
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())
print("---------------------")

// Functions are a first-class type. This means that a function can return another function as its value.
func makeIncremented() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
      return 3 + number
    }
    return addOne
}
let increment = makeIncremented()
print(increment(10))
print("---------------------")

// A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
// less than ten 
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))
print("---------------------")

/** 
Functions are actually a special case of closures: blocks of code that can be called later. 
The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it’s executed — you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.
*/

let mapNum = numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})
print("Map = \(mapNum)")
print("---------------------")


// You have several options for writing closures more concisely. 
// When a closure’s type is already known, such as the callback for a delegate, 
// you can omit the type of its parameters, its return type, or both. 
// Single statement closures implicitly return the value of their only statement.
let mappedNumbers = numbers.map({ number in 3 * number })
print("Map = \(mappedNumbers)")
// Prints "[60, 57, 21, 36]"
print("---------------------")


// You can refer to parameters by number instead of by name — this approach is especially useful in very short closures. 
// A closure passed as the last argument to a function can appear immediately after the parentheses.
// When a closure is the only argument to a function, you can omit the parentheses entirely.
let sortedNumbers = numbers.sorted { $0 > $1 }
print("Sorted: \(sortedNumbers)")
// Prints "[20, 19, 12, 7]
print("---------------------")

func filterGreaterThanValue(closure: (Int) -> Bool,  numbers: [Int]) -> [Int] {
  var numberGreaterThanValue = [Int]()

  for num in numbers { 
    if closure(num) {
      numberGreaterThanValue.append(num)
    }
  }
  return numberGreaterThanValue
}
// less than ten 
func lessThanTens(value: Int) -> Bool {
    return value < 10
}
// create closure 
var  number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let result = filterGreaterThanValue(closure: lessThanTens, numbers: number)
print("Result: \(result)")
print("---------------------")

