
/// Continue
/// The continue statement tells a loop to stop what 
/// it’s doing and start again at the beginning of the next iteration through the loop.
/// It says “I am done with the current loop iteration” without leaving the loop altogether.
/// The following example removes all vowels and spaces from a lowercase string to create a cryptic puzzle phrase:

/// The code above calls the continue keyword whenever it matches a vowel or a space,
/// causing the current iteration of the loop to end immediately
/// and to jump straight to the start of the next iteration.

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print("Output: \(puzzleOutput)")

/// Break in a Loop Statement
/// When used inside a loop statement, break ends the loop’s execution immediately 
/// and transfers control to the code after the loop’s closing brace (}).
/// No further code from the current iteration of the loop is executed,
/// and no further iterations of the loop are started.

/// Break in a Switch Statement
/// When used inside a switch statement, break causes the switch statement to end its execution immediately
/// and to transfer control to the code after the switch statement’s closing brace (}).

/// The switches on a Character value and determines whether 
/// it represents a number symbol in one of four languages. 
/// For brevity, multiple values are covered in a single switch case.

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value couldn't be found for \(numberSymbol).")
}/// Prints "The integer value of 三 is 3."

/// Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

/// * Labeled (gameLoop)
/// uses the break and continue statements with
/// a labeled while loop for an adapted version of the Snakes and Ladders game
/// that you saw earlier in this chapter. This time around, the game has an extra rule:
/// - To win, you must land exactly on square 25.
/// - If a particular dice roll would take you beyond square 25,
/// - you must roll again until you roll the exact number needed to land on square 25.
/// - The game board is the same as before.

/// The values of finalSquare, board, square, and diceRoll are initialized in the same way as before:
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

/// The game uses a while loop and a switch statement to implement the game’s logic.
/// The while loop has a statement label called gameLoop to indicate that it’s 
/// the main game loop for the Snakes and Ladders game.
/// The while loop’s condition is while square != finalSquare, 
/// to reflect that you must land exactly on square 25.
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
    print("Value: \(square)", terminator: " ")
}
print("")
print("Game over!")
/**
The dice is rolled at the start of each loop. Rather than moving the player immediately, the loop uses a switch statement to consider the result of the move and to determine whether the move is allowed:

If the dice roll will move the player onto the final square, the game is over. The break gameLoop statement transfers control to the first line of code outside of the while loop, which ends the game.

If the dice roll will move the player beyond the final square, the move is invalid and the player needs to roll again. The continue gameLoop statement ends the current while loop iteration and begins the next iteration of the loop.

In all other cases, the dice roll is a valid move. The player moves forward by diceRoll squares, and the game logic checks for any snakes and ladders. The loop then ends, and control returns to the while condition to decide whether another turn is required.
*/

/// The condition of a loop can be at the end instead, 
/// ensuring that the loop is run at least once.
var n = 2
while n < 100 {
    n *= 2
}
print("Total: \(n)")

/// Use while to repeat a block of code until a condition changes. 
var m = 2
repeat {
    m *= 2
} while m < 100
print("Total: \(m)")

/// Use for to iterate over an array, dictionary.
var count = 1
while count <= 10 {
    print(count, terminator: " ")
    count += 1
}
print("")

/// can keep an index in a loop by using ..< to make a range of indexes
/// Use ..< to make a range that omits its upper value, and 
var total = 0
for i in 0..<5 {
    total += i
}
print("Total \(total)")

/// ... to make a range that includes both values
var sum = 0
for s in 0...5 {
    sum += s
}
print("Sum: \(sum)")

