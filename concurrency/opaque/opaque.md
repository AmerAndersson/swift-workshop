# opaque

In this example, AnyUserDataCache is an opaque type that wraps an instance of InMemoryUserDataCache. It conforms to the UserDataCache protocol without revealing the specific type of user data it stores. This abstraction allows us to change the underlying cache implementation without affecting the rest of the code that relies on the UserDataCache interface.
