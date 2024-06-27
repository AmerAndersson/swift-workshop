# Let's explore an example of how to use the `Hashable` protocol in Swift

1. **Basic Example**:
   Suppose we have a `Person` struct with a single property: `name`. We want to make instances of `Person` hashable. Here's how you can do it:

   ```swift
   struct Person: Hashable {
       var name: String
   }

   let person1 = Person(name: "Sabby")
   let person2 = Person(name: "Smith")

   print("Hash value for person1:", person1.hashValue)
   print("Hash value for person2:", person2.hashValue)
   ```

Output:

```s
Hash value for person1: 754256748862435114
Hash value for person2: -6408043519205941253
```

   In this example, `person1` and `person2` have different hash values because their `name` properties are distinct¹.

2. **Selective Hashing**:
   Sometimes you may want to compare only specific properties. For this, you can customize the hash function using the `hash(into:)` method. Let's modify our `Person` struct:

   ```swift
   struct Person: Hashable {
       var name: String
       var salary: Int

       func hash(into hasher: inout Hasher) {
           hasher.combine(salary)
       }
   }

   let employee1 = Person(name: "Sabby", salary: 40000)
   let employee2 = Person(name: "Cathy", salary: 30000)

   print("Different hash value:")
   print(employee1.hashValue)
   print(employee2.hashValue)

   let employee3 = Person(name: "Lanny", salary: 50000)
   let employee4 = Person(name: "Lanny", salary: 50000)

   print("\nSame hash value:")
   print(employee3.hashValue)
   print(employee4.hashValue)
   ```

   Output:

   ```s
   Different hash value:
   3934953678767833906
   4997634560615333199

   Same hash value:
   1588129438168529318
   1588129438168529318
   ```

   In this modified example, we use the `salary` property for hashing. Different salaries result in different hash values, while identical salaries yield the same hash value¹.

3. **Automatic Conformance for Enums**:
   Enums with unique cases are automatically hashable. For example:

   ```swift
   enum Color: Hashable {
       case red
       case green
       case blue
   }
   ```

   Since enum cases are unique by definition, they are automatically hashable without additional implementation⁴.

Remember that the `Hashable` protocol is essential for efficient storage and retrieval in hash-based collections like dictionaries and sets. Feel free to explore more complex examples or ask any further questions! 😊

## To make a custom enum with associated values conform to the `Hashable` protocol in Swift, follow these steps:

1. **Define Your Enum**:
   - Start by creating your custom enum with associated values.
   - The associated values can be of any type (e.g., strings, integers, other enums, or even custom structs).

2. **Conform to Hashable**:
   - Extend your enum to conform to the `Hashable` protocol.
   - Implement the `hash(into:)` method within the extension.
   - In this method, combine the enum case and its associated values using the `hasher.combine(_:)` method.

3. **Example Implementation**:
   Let's say we have an enum called `Fruit` representing different types of fruits with associated values:

   ```swift
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
   ```

   In this example:
   - We define an enum `Fruit` with three cases: `.apple`, `.banana`, and `.orange`.
   - Each case has associated values (e.g., `variety`, `length`, and `segments`).
   - The `hash(into:)` method combines the enum case name and its associated values to create a hash value.

Remember that custom enums with associated values can be made hashable by implementing the `hash(into:)` method. This allows you to use them efficiently as keys in dictionaries or elements in sets. If you have any more questions or need further clarification, feel free to ask! 😊