// Suppose we want to create a simple caching mechanism for user data. 
// We’ll define a protocol called UserDataCache
protocol UserDataCache {
    associatedtype User
    func getUserData(for userId: String) -> User
    mutating func cacheUserData(_ userData: User, for userId: String)
}

struct User {
    let id: String
    let name: String
    // Other user properties...
}

struct InMemoryUserDataCache: UserDataCache {
    private var cache: [String: User] = [:]

    func getUserData(for userId: String) -> User {
        return cache[userId] ?? User(id: userId, name: "Unknown")
    }

    mutating func cacheUserData(_ userData: User, for userId: String) {
        cache[userId] = userData
    }
}

// Usage
var cache = InMemoryUserDataCache()
let userId = "123"
let user = User(id: userId, name: "Alice")
cache.cacheUserData(user, for: userId)
let cachedUser = cache.getUserData(for: userId)
print("Cached user: \(cachedUser.id) \(cachedUser.name)")
