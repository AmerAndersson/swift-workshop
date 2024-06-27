/// Generates a random integer ID between 1 and 1000: 
let id = Int.random(in: 1...1000)
print("Random ID: \(id)")

/// A random double amount between 0 and 10:
let amount = Double.random(in: 0...10)
print("Random Amount: \(amount)")

/// Generates a random boolean value
let randomBool = Bool.random() 
print("Random Bool: \(randomBool)")

/// Generates a random integer between 1 and 99:
let randomInt = Int.random(in: 1..<100) 
print("Random Int: \(randomInt)")

/// Generates a random double between e (approximately 2.71828) and π (approximately 3.14159)
let randomDouble = Double.random(in: 2.71828...3.14159) 
print("Random Double: \(randomDouble)")

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}




