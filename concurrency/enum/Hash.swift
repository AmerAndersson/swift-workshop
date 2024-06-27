// implementation an enum called Fruit representing 
// different types of fruits with associated values:
enum Fruit {
    case apple(variety: String)
    case banana(length: Int)
    case orange(segments: Int)
}

// Conforming to Hashable
extension Fruit: Hashable {
    func hash(into hasher: inout Hasher) {
        // Combine the enum case and associated values
        switch self {
        case .apple(let variety):
            hasher.combine("apple")
            hasher.combine(variety)
        case .banana(let length):
            hasher.combine("banana")
            hasher.combine(length)
        case .orange(let segments):
            hasher.combine("orange")
            hasher.combine(segments)
        }
    }
}

// Example usage
let apple1 = Fruit.apple(variety: "Fuji")
let apple2 = Fruit.apple(variety: "Gala")
let banana = Fruit.banana(length: 20)
let orange = Fruit.orange(segments: 8)

print("Hash value for apple1:", apple1.hashValue)
print("Hash value for apple2:", apple2.hashValue)
print("Hash value for banana:", banana.hashValue)
print("Hash value for orange:", orange.hashValue)
