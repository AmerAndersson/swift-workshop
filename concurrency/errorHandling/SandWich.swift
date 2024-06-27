func makeASandwich() throws {
    // TODO: Implement sandwich-making logic here
    // Add some fresh ingredients:
    let bread = "whole wheat"
    let lettuce = "crisp romaine"
    let tomato = "ripe beefsteak"
    let cheese = "sharp cheddar"
    let condiments = ["mayonnaise", "mustard", "pepper"]
    
    // Assemble the sandwich
    let sandwich = "\(bread) bread with \(lettuce), \(tomato), and \(cheese). Add a dash of \(condiments.joined(separator: ", "))."
    
    // Enjoy your delicious sandwich!
    print(sandwich)
    
    // Uh-oh, something went wrong!
    throw SandwichError.sandwichNotReady
}

enum SandwichError: Error {
    case sandwichNotReady
}

do {
    try makeASandwich()
} catch SandwichError.sandwichNotReady {
    print("Oops! The sandwich isn't ready yet. Handle the error gracefully.")
    // You can add additional error handling logic here
}