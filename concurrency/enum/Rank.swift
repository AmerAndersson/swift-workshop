
// Enumerations and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }

    static func compare(a: Rank, b: Rank) -> Bool {
        return a.rawValue > b.rawValue
    }
}

// Example usage:
let rank1 = Rank.ace
let rank2 = Rank.king

if Rank.compare(a: rank1, b: rank2) {
    print("\(rank1.simpleDescription()) is greater than \(rank2.simpleDescription())")
} else {
    print("\(rank2.simpleDescription()) is greater than \(rank1.simpleDescription())")
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print(aceRawValue)
if let convertedRank = Rank(rawValue: 12) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}


// The case values of an enumeration are actual values, not just another way of writing their raw values. 
// In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
enum Suit {
    case spades, hearts, diamonds, clubs


    func suitDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
   func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.suitDescription()
let heartsColor = hearts.color()

print("Hearts suit: \(heartsDescription), Color: \(heartsColor)")  // Output: "Hearts suit: hearts, Color: red"


/**
consider the case of requesting the sunrise and sunset times from a server. 
The server either responds with the requested information, or it responds with a description of what went wrong.
*/















/* 
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday
 */
