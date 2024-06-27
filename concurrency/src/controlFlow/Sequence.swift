
// Sequence
// A type that provides sequential, iterated access to its elements.
// A sequence is a list of values that you can step through one at a time. 
// The most common way to iterate over the elements of a sequence is to use a for-in loop
let oneTwoThree = 1...10
for number in oneTwoThree {
    print(number, terminator: " ")
}
print("")
print("----------------------")

/// Structure code with branches, loops, and early exits
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
// Prints "11"

let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration)
// Prints "Score: 11 🎉"
print("")

// checks to see whether a particular insect is in an array.
let bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
var hasMosquito = false
for bug in bugs {
    if bug == "Mosquito" {
        hasMosquito = true
        break
    }
}
print("'bugs' has a mosquito: \(hasMosquito)")
print("----------------------")

// checks to see whether a particular insect is in an array. contains(_:) method
if bugs.contains("Mosquito") {
    print("Break out the bug spray.")
} else {
    print("Whew, no mosquitos!")
}// Prints "Whew, no mosquitos!"


// A definition of a Countdown sequence that serves as its own iterator. 
// The makeIterator() method is provided as a default implementation.
// To add Sequence conformance to your own custom type, add a makeIterator() method that returns an iterator.
// Conforming to the Sequence Protocol
struct Countdowns: Sequence {
    let count: Int
    func makeIterator() -> CountdownIterator {
        return CountdownIterator(count: count)
    }
}

struct CountdownIterator: IteratorProtocol {
    var count: Int
    mutating func next() -> Int? {
       if count > 0 {
            defer { count -= 1 }
            return count
        } else {
            return nil
        }
    }
}

let countdown = Countdowns(count: 10)
for number in countdown {
    print(number, terminator: " ")
}
print("")
print("----------------------")

/**
* Conforming to the Sequence Protocol
* Making your own custom types conform to Sequence enables many useful operations, 
* like for-in looping and the contains method, without much effort. 
* To add Sequence conformance to your own custom type, add a makeIterator() method that returns an iterator.
* A definition of a Countdown sequence that serves as its own iterator. 
* The makeIterator() method is provided as a default implementation.
*/


// if your type can act as its own iterator, 
// implementing the requirements of the IteratorProtocol protocol 
// and declaring conformance to both Sequence and IteratorProtocol are sufficient.
struct Countdown: Sequence, IteratorProtocol {
    var count: Int

    mutating func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
}

let threeToGo = Countdown(count: 10)
for i in threeToGo {
    print(i, terminator: " ")
}
print("")

/// calculate 10 common multiples for two numbers:
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)