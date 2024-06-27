# User Defaults Properties

```swift

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
}

// Data Validation:
// Property wrappers can enforce validation rules on property values.
// A property wrapper that ensures a numeric value falls within a specific range
@propertyWrapper
struct Ranged<Value: Comparable> {
    let minimum: Value
    let maximum: Value
    private var value: Value

    init(wrappedValue: Value, min: Value, max: Value) {
        self.minimum = min
        self.maximum = max
        self.value = min...max ~= wrappedValue ? wrappedValue : min
    }

    var wrappedValue: Value {
        get { value }
        set { value = min(maximum, max(minimum, newValue)) }
    }
}

// Usage
struct Product {
    @Ranged(min: 0, max: 100)
    var discountPercentage: Double
}

var product = Product()
product.discountPercentage = 50
print(product.discountPercentage)


// Lazy Initialization:
// Property wrappers can delay initialization until the property is accessed.
// A property wrapper that initializes a complex object lazily
@propertyWrapper
struct LazyInitialized<Value> {
    private var initializer: () -> Value
    private var value: Value?

    init(initialValue: @autoclosure @escaping () -> Value) {
        self.initializer = initialValue
    }

    var wrappedValue: Value {
        mutating get {
            if value == nil {
                value = initializer()
            }
            return value!
        }
    }
}

// Usage
struct UserManager {
    @LazyInitialized
    var currentUser: User = User.loadFromDisk()
}

// Thread Safety:
// Property wrappers can make properties thread-safe.
// A property wrapper that synchronizes access to a shared resource
@propertyWrapper
struct Synchronized<Value> {
    private var value: Value
    private var lock = NSLock()

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get {
            lock.lock()
            defer { lock.unlock() }
            return value
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            value = newValue
        }
    }
}

// Usage
class SharedResource {
    @Synchronized
    var counter: Int = 0
}

// Debugging and Logging:
// Property wrappers can add logging or debugging behavior.
// A wrapper that logs property changes
@propertyWrapper
struct LogChanges<Value> {
    private var value: Value

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get { value }
        set {
            print("Value changed from \(value) to \(newValue)")
            value = newValue
        }
    }
}

// Usage
struct Order {
    @LogChanges
    var totalPrice: Double
}

// Removing Boilerplate Code:
// Property wrappers reduce repetitive code patterns.
// Simplifying access to UserDefaults keys or removing manual validation checks
@propertyWrapper
struct Keyed<Value> {
    private let key: String
    private var value: Value

    init(key: String, defaultValue: Value) {
        self.key = key
        self.value = UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
    }

    var wrappedValue: Value {
        get { value }
        set {
            value = newValue
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

// Usage
struct AppConfiguration {
    @Keyed(key: "api_base_url", defaultValue: "https://api.example.com")
    static var apiBaseUrl: String
}
