# TemperatureError

```swift
// class and handles temperature-related errors:
I apologize for the confusion. It seems there was a mix-up between Python and Swift code. Let's correct that.

Below is the corrected Swift code snippet that defines the `TemperatureError` class and handles temperature-related errors:

```swift
class TemperatureError: Error {
    enum ErrorType {
        case boiling
        case freezing
    }
    
    let type: ErrorType
    
    init(_ type: ErrorType) {
        self.type = type
    }
}

func checkTemperature(_ temperature: Double) throws {
    if temperature >= 100 {
        throw TemperatureError(.boiling)
    } else if temperature <= 0 {
        throw TemperatureError(.freezing)
    } else {
        print("Temperature is within safe range: \(temperature)°C")
    }
}

do {
    // Example usage
    try checkTemperature(105)
} catch let error as TemperatureError {
    switch error.type {
    case .boiling:
        print("Error: Boiling temperature reached!")
    case .freezing:
        print("Error: Freezing temperature reached!")
    }
} catch {
    print("Unknown error occurred.")
}
```

In this corrected Swift code:

- We define the `TemperatureError` class, which conforms to the `Error` protocol.
- The `checkTemperature` function raises this custom exception when the temperature exceeds boiling or freezing limits.
- The example usage demonstrates how to handle the exception properly.
Feel free to test this updated code, and let me know if you have any further questions or need additional assistance! 😊

```

We define the TemperatureError class, which conforms to the Error protocol.
The checkTemperature function raises this custom exception when the temperature exceeds boiling or freezing limits.
The example usage demonstrates how to handle the exception properly.


Certainly! Custom errors play a crucial role in Swift programming, allowing you to handle exceptional scenarios effectively. Let's explore a real-world example where custom errors are used:

### Scenario: Inventory Management System

Imagine you're building an inventory management system for an e-commerce platform. The system tracks product quantities, handles orders, and ensures that items are available for purchase. Here's how custom errors can be applied in this context:

1. **Custom Error Type: `OutOfStockError`**
   - Suppose a customer places an order for a product, but it's out of stock. To handle this situation, define a custom error type called `OutOfStockError`.

    ```swift
    enum OutOfStockError: Error {
        case productUnavailable(productID: Int)
    }
    ```

2. **Inventory Check Function: `checkInventory(forProductID:)`**
   - Implement a function that checks if a product is in stock based on its ID.

    ```swift
    func checkInventory(forProductID productID: Int) throws {
        // Simulate fetching inventory data (e.g., from a database)
        let availableQuantity = getAvailableQuantity(forProductID: productID)

        guard availableQuantity > 0 else {
            throw OutOfStockError.productUnavailable(productID: productID)
        }
    }
    ```

3. **Order Processing: `processOrder(order:)`**
   - When processing an order, call the `checkInventory` function to ensure the product is available.

    ```swift
    func processOrder(order: Order) {
        do {
            try checkInventory(forProductID: order.productID)
            // Proceed with order processing
            print("Order placed successfully!")
        } catch let error as OutOfStockError {
            switch error {
            case .productUnavailable(let productID):
                print("Error: Product \(productID) is out of stock.")
            }
        } catch {
            print("Unknown error occurred.")
        }
    }
    ```

4. **Usage: Handling Out-of-Stock Scenario**
   - When a customer places an order, call `processOrder` to handle potential out-of-stock errors.

    ```swift
    let customerOrder = Order(productID: 123, quantity: 2)
    processOrder(order: customerOrder)
    ```

5. **Benefits of Custom Errors**:
   - By using custom errors, you provide clear feedback to users when specific exceptional conditions occur (e.g., out-of-stock products).
   - The code becomes more readable and maintainable, as error handling logic is encapsulated in custom types.
   - You can extend the `OutOfStockError` type with additional information (e.g., reason for unavailability) as needed.

In this scenario, custom errors enhance the reliability of your inventory management system by gracefully handling out-of-stock situations. Remember that real-world applications often involve more complex error scenarios, but the principles remain the same: define custom error types, handle them appropriately, and improve the overall quality of your codebase¹[1] ²[2]. 😊


