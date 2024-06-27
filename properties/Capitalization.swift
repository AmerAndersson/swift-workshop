// create a custom property wrapper that capitalizes a string
// Implement the wrappedValue property, which represents the actual value stored by the property wrapper.
// Optionally, you can provide additional features using the projected value (e.g., projectedValue).
import Foundation
@propertyWrapper
struct Capitalized {
    private var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }
}

// Usage
struct User {
    @Capitalized var name: String
}

var user = User()
user.name =  "sunday, monday, happy days" // Automatically capitalized
print(user.name)
print("------------------------------")

// (Using Foundation): Import the Foundation framework and use the capitalized property
// on an NSString instance (which is bridged to Swift’s String type):
let days = "sunday, monday, happy days"
print((days as NSString).capitalized)
print("------------------------------")

// (Pure Swift): If you prefer to avoid importing Foundation,
// you can manually capitalize each word in the string using Swift:
extension String {
    var capitalizedWords: String {
        return self.split(separator: " ").map { String($0.prefix(1)).uppercased() + String($0.dropFirst()) }.joined(separator: " ")
    }
}

let str = "sunday, monday, happy days"
print(str.capitalizedWords)

// User Defaults Properties:
// create a property wrapper to simplify working with UserDefaults.
// Storing a boolean value indicating whether the user has seen the app introduction
@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}

// Usage
struct AppSettings {
    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool
  // introductory screen
}

print(AppSettings.hasSeenAppIntroduction)
AppSettings.hasSeenAppIntroduction = true
print(AppSettings.hasSeenAppIntroduction)
