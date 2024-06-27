# Set Operations

Sets provide a suite of mathematical set operations. For example, you can efficiently test a set for membership of an element or check its intersection with another set:

Use the contains(_:) method to test whether a set contains a specific element.

Use the “equal to” operator (==) to test whether two sets contain the same elements.

Use the isSubset(of:) method to test whether a set contains all the elements of another set or sequence.

Use the isSuperset(of:) method to test whether all elements of a set are contained in another set or sequence.

Use the isStrictSubset(of:) and isStrictSuperset(of:) methods to test whether a set is a subset or superset of, but not equal to, another set.

Use the isDisjoint(with:) method to test whether a set has any elements in common with another set.

## You can also combine, exclude, or subtract the elements of two sets

Use the union(_:) method to create a new set with the elements of a set and another set or sequence.
Use the intersection(_:) method to create a new set with only the elements common to a set and another set or sequence.
Use the symmetricDifference(_:) method to create a new set with the elements that are in either a set or another set or sequence, but not in both.
Use the subtracting(_:) method to create a new set with the elements of a set that are not also in another set or sequence.
You can modify a set in place by using these methods’ mutating counterparts: formUnion(_:), formIntersection(_:), formSymmetricDifference(_:), and subtract(_:)

* Set Membership and Equality
The illustration below depicts three sets — a, b and c — with overlapping regions representing elements shared among sets.
Set a is a superset of set b, because a contains all elements in b. Conversely, set b is a subset of set a,
because all elements in b are also contained by a. Set b and set c are disjoint with one another, because they share no elements in common.

Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
Use the isDisjoint(with:) method to determine whether two sets have no values in common.

```s
var myEmptySet: Set<Int> = []
var anotherEmptySet: Set<String> = []
var letters: Set<Character> = []
letters.insert("a") // Now `letters` contains one value of type `Character`

Certainly! In Swift, sets provide a variety of useful operations. Let's explore some of them:

1. **Membership Testing**:
   - You can check whether a specific element exists in a set using the `contains(_:)` method. For example:
     ```swift
     let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
     if ingredients.contains("sugar") {
         print("No thanks, too sweet.")
     }
     // Output: "No thanks, too sweet."
     ```

2. **Set Operations**:
   - Sets support several mathematical set operations:
     - `isSubset(of:)`: Tests whether a set contains all the elements of another set or sequence.
     - `isSuperset(of:)`: Tests whether all elements of a set are contained in another set or sequence.
     - `isStrictSubset(of:)` and `isStrictSuperset(of:)`: Test whether a set is a subset or superset (but not equal) to another set.
     - `isDisjoint(with:)`: Checks whether a set has any elements in common with another set.
     - `union(_:)`: Creates a new set with elements from both the original set and another set or sequence.
     - `intersection(_:)`: Creates a new set with only the elements common to both sets.
     - `symmetricDifference(_:)`: Creates a new set with elements that are in either set but not both.
     - `subtracting(_:)`: Creates a new set with elements from the original set that are not in another set or sequence.

3. **In-Place Modifications**:
   - You can modify a set in place using the mutating counterparts of the above methods:
     - `formUnion(_:)`, `formIntersection(_:)`, `formSymmetricDifference(_:)`, and `subtract(_:)`.
     
Remember that sets in Swift are unordered collections of unique elements, making them useful for scenarios where uniqueness matters and order doesn't. Happy coding! 🚀

```

As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set or update the value for a particular key. Like the subscript examples above, the updateValue(_:forKey:) method sets a value for a key if none exists, or updates the value if that key already exists. Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.

The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type. For a dictionary that stores String values, for example, the method returns a value of type String?, or “optional String”. This optional value contains the old value for that key if one existed before the update, or nil if no value existed

You can also use subscript syntax to retrieve a value from the dictionary for a particular key. Because it’s possible to request a key for which no value exists, a dictionary’s subscript returns an optional value of the dictionary’s value type. If the dictionary contains a value for the requested key, the subscript returns an optional value containing the existing value for that key. Otherwise, the subscript returns nil:

Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method. This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed: