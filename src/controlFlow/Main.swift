/// iterate over a sequence, 
/// such as items in an array, 
/// ranges of numbers, 
/// characters in a string,
/// or a dictionary to access its key-value pairs.

/// iterate over the items in an array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
print("----------------------")

/// iterate over a dictionary to access its key-value pairs.
/// the dictionary’s keys are decomposed into a constant called animalName, 
/// and the dictionary’s values are decomposed into a constant called legCount.
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
print("----------------------")

/// iterate over numeric ranges.
/// prints the first few entries in a five-times table:
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
print("----------------------")

/// If you don’t need each value from a sequence, 
/// you can ignore the values by using an underscore in place of a variable name.
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
print("----------------------")

/// Consider drawing the tick marks for every minute on a watch face. 
/// You want to draw 60 tick marks, starting with the 0 minute.
/// Use the half-open range operator (..<) to include the lower bound but not the upper bound
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
    print(tickMark, terminator: " ")
}
print("")
print("----------------------")

/// Some users might want fewer tick marks in their UI.
/// They could prefer one mark every 5 minutes instead. 
/// Use the stride(from:to:by:) function to skip the unwanted marks
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
        print(tickMark, terminator: " ")
}
print("")
print("----------------------")

/// Closed ranges are also available, by using stride(from:through:by:)
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
    print(tickMark, terminator: " ")
}
print("")
print("----------------------")

/// While Loops
/// A while loop performs a set of statements until a condition becomes false. 
/// These kinds of loops are best used when the number of iterations isn’t known before the first iteration begins.
/// Swift provides two kinds of while loops:
/// while evaluates its condition at the start of each pass through the loop.
/// repeat-while evaluates its condition at the end of each pass through the loop
 

/**
* * Game of Snakes and Ladders (also known as Chutes and Ladders)
* The rules of the game are as follows:
- The board has 25 squares, and the aim is to land on or beyond square 25.
- The player’s starting square is “square zero”, which is just off the bottom-left corner of the board.
- Each turn, you roll a six-sided dice and move by that number of squares, 
  following the horizontal path indicated by the dotted arrow above.
- If your turn ends at the bottom of a ladder, you move up that ladder.
- If your turn ends at the head of a snake, you move down that snake.
- The game board is represented by an array of Int values. Its size is based on a constant called finalSquare,
* which is used to initialize the array and also to check for a win condition later in the example. 
* Because the players start off the board, on “square zero”, the board is initialized with 26 zero Int values, not 25.
* 
* Some squares are then set to have more specific values for the snakes and ladders. 
* Squares with a ladder base have a positive number to move you up the board, whereas 
* squares with a snake head have a negative number to move you back down the board.
* Square 3 contains the bottom of a ladder that moves you up to square 11. 
* To represent this, board[03] is equal to +08, which is equivalent to an integer value of 8 (the difference between 3 and 11).
* To align the values and statements, the unary plus operator (+i) is explicitly used with the unary minus operator (-i) 
* and numbers lower than 10 are padded with zeros.
*/

/// Its size is based on a constant finalSquare
/// square zero,the board is initialized with 26 zero Int values, not 25.
/// while evaluates its condition at the start of each pass through the loop.
let finalSquare = 25 
var board = [Int](repeating: 0, count: finalSquare + 1)

/// Some squares are then set to have more specific values for the snakes and ladders
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")
print("---------------------------------")


/// Its size is based on a constant finalSquares
/// square zero,the board is initialized with 26 zero Int values, not 25.
/// repeat-while evaluates its condition at the end of each pass through the loop
let finalSquares = 25
var boards = [Int](repeating: 0, count: finalSquares + 1)
boards[03] = +08; boards[06] = +11; boards[09] = +09; boards[10] = +02
boards[14] = -10; boards[19] = -11; boards[22] = -02; boards[24] = -08

var squares = 0
var diceRolls = 0
repeat {
    // move up or down for a snake or ladder
    squares += boards[squares]
    // roll the dice
    diceRolls += 1
    if diceRolls == 7 { diceRolls = 1 }
    // move by the rolled amount
    squares += diceRolls
} while squares < finalSquares
print("Game over!")
print("---------------------------------")

/// Conditional Statements 
/// checks whether the temperature is less than 
/// or equal to 32 degrees Fahrenheit (the freezing point of water). 
/// If it is, a message is printed. Otherwise, no message is printed.
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

/// Because the temperature has increased to 40 degrees Fahrenheit,
/// it’s no longer cold enough to advise wearing a scarf and so 
/// the else branch is triggered instead.
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

/// if statement was added to respond to particularly warm temperatures.
/// The final else clause remains, and it prints a response for any 
/// temperatures that aren’t too warm or too cold
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}
/// Because the temperature isn’t cold enough to trigger the 
/// if condition or warm enough to trigger the else if condition, no message is printed
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
   print("It's not that cold. Wear a T-shirt.")
}
print("---------------------------------")

/// Swift provides a shorthand spelling of if that you can use when setting values
/// each of the branches sets a value for the weatherAdvice constant, which is printed after the if statement.
/// Define the temperature in Celsius
let temperatureInCelsius = 25
let weatherAdvice: String

if temperatureInCelsius <= 0 {
    weatherAdvice = "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    weatherAdvice = "It's really warm. Don't forget to wear sunscreen."
} else {
    weatherAdvice = "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice)

/// An if expression, you can write this code more concisely:
let weatherAdvices = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
print(weatherAdvices)

/// An if expression can respond to unexpected failures 
/// by throwing an error or calling a function like fatalError(_:file:line:) that never returns. 
// Define the TemperatureError enum
enum TemperatureError: Error {
    case boiling
}

// Check the temperature and set weatherAdvice accordingly
do {
    if temperatureInCelsius > 100 {
        throw TemperatureError.boiling
    } else {
        let weatherAdvice = "It's a reasonable temperature."
        print(weatherAdvice)
    }
} catch {
    print(error)
}
print("---------------------------------")
