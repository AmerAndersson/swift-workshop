// We define a ThreadSafe property wrapper that ensures thread-safe access to the wrapped value.
// The wrappedValue getter and setter are protected by an NSLock.
// We apply the ThreadSafe wrapper to both counter and data properties in the MyModel struct.
// Now, you can reuse this thread-safe behavior across different properties without duplicating the management code
import Foundation
// Define a property wrapper called `ThreadSafe<T>`
@propertyWrapper
struct ThreadSafe<T> {
    private var value: T
    private var lock = NSLock()

    init(wrappedValue: T) {
        self.value = wrappedValue
    }

    var wrappedValue: T {
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

// Usage example
struct MyModel {
    @ThreadSafe var counter: Int = 0
    @ThreadSafe var data: [String] = []
}

var model = MyModel()
model.counter += 1
model.data.append("Hello, World!")

print("Counter: \(model.counter)") // Thread-safe access
print("Data: \(model.data)") // Thread-safe access

