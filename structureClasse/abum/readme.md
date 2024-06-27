# Swift newValue

1. Computed Property: The perimeter property is a computed property. Unlike stored properties, which hold data directly, computed properties calculate their value dynamically every time they are accessed. They combine the behavior of stored properties and functions.
2. Getter: The get block calculates the value of perimeter when it’s accessed. In this case, it returns 3.0 \_ sideLength.
3. Setter: The set block runs when you assign a new value to perimeter. The newValue identifier represents the value you’re trying to assign. In your example, it adjusts the sideLength based on the new value.
   If you set perimeter to a specific value, the setter calculates the corresponding sideLength to maintain the desired perimeter.
   For instance, if you set perimeter to 18, the sideLength will be set to 6 (since 3.0 \_ 6 = 18).
   In summary, newValue is a special identifier that Swift provides within the setter to capture the value being assigned. It allows you to customize how properties are set based on user input or other factors

```swift
class NetworkManager {
    func fetchData(completion: () -> Void) {
        // Fetch data asynchronously
        completion() // Error: Use 'self' to access instance members
        self.completion() //   You’d need to use inside the closure.
    }
}

// Type Methods (Static Methods):
// When accessed in a type method (static method), self refers to the actual type itself (not an instance).
//  It returns what Swift calls a “Metatype.
class MyClass {
    static func printClassName() {
        print("Class name: \(self)") // Refers to the type
    }
}

```
