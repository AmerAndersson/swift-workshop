# UUID

Using SwiftUI (Swift 5.5 and later): In SwiftUI, you can define a random color extension
UUIDs are guaranteed to be unique across different devices and time. They are commonly used for identifying objects, sessions, or users.
To generate UUIDs, Swift provides the UUID type. You can create a unique identifier using the following code

```swift
public extension Color {
    static func random(randomOpacity: Bool = false) -> Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}

let uniqueID = UUID()
print("Generated UUID: \(uniqueID)")
```
