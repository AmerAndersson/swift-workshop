/**
- Nested Types
Define types inside the scope of another type.

Enumerations are often created to support a specific class or structure’s functionality. Similarly, it can be convenient to define utility structures purely for use within the context of a more complex type, and protocols that are normally used in conjunction with a specific type. To accomplish this, Swift enables you to define nested types, whereby you nest supporting types like enumerations, structures, and protocols within the definition of the type they support.

To nest a type within another type, write its definition within the outer braces of the type it supports. Types can be nested to as many levels as are required

- Nested Types in Action
Define a structure called `BlackjackCard`, which models a playing card as used in the game of `Blackjack`. The `BlackjackCard` structure contains two nested enumeration types called Suit and Rank.

In Blackjack, the Ace cards have a value of either one or eleven. This feature is represented by a structure called Values, which is nested within the Rank enumeration:
*/
struct BlackjackCard {

    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }

    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
// To initialize a new constant called theAceOfSpades:
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
// Prints "theAceOfSpades: suit is ♠, value is 1 or 11"

// ** Referring to Nested Types
// To use a nested type outside of its definition context, 
// prefix its name with the name of the type it’s nested within
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
let jackSymbol = BlackjackCard.Rank.jack.rawValue
print("heartsSymbol is \(heartsSymbol)")
print("jackSymbol is \(jackSymbol)")
// heartsSymbol is "♡"

// For the example above, this enables the names of Suit, Rank, and Values to be kept deliberately short,
// because their names are naturally qualified by the context in which they’re defined.
