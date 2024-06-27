
# Note

Optional chaining in Swift is similar to messaging nil in Objective-C, but in a way that works for any type, and that can be checked for success or failure.

## Optional Chaining as an Alternative to Forced Unwrapping

You specify optional chaining by placing a question mark (?) after the optional value on which you wish to call a property, method or subscript if the optional is non-nil. This is very similar to placing an exclamation point (!) after an optional value to force the unwrapping of its value. The main difference is that optional chaining fails gracefully when the optional is nil, whereas forced unwrapping triggers a runtime error when the optional is nil.

To reflect the fact that optional chaining can be called on a nil value, the result of an optional chaining call is always an optional value, even if the property, method, or subscript you are querying returns a non-optional value. You can use this optional return value to check whether the optional chaining call was successful (the returned optional contains a value), or didn’t succeed due to a nil value in the chain (the returned optional value is nil).

Specifically, the result of an optional chaining call is of the same type as the expected return value, but wrapped in an optional. A property that normally returns an Int will return an Int? when accessed through optional chaining.

The next several code snippets demonstrate how optional chaining differs from forced unwrapping and enables you to check for success.

The code above succeeds when john.residence has a non-nil value and will set roomCount to an Int value containing the appropriate number of rooms. However, this code always triggers a runtime error when residence is nil, as illustrated above.

Optional chaining provides an alternative way to access the value of numberOfRooms. To use optional chaining, use a question mark in place of the exclamation point:

This tells Swift to “chain” on the optional residence property and to retrieve the value of numberOfRooms if residence exists.

## Defining Model Classes for Optional Chain

Because the attempt to access numberOfRooms has the potential to fail, the optional chaining attempt returns a value of type Int?, or “optional Int”. When residence is nil, as in the example above, this optional Int will also be nil, to reflect the fact that it was not possible to access numberOfRooms. The optional Int is accessed through optional binding to unwrap the integer and assign the non-optional value to the roomCount constant.

Note that this is true even though numberOfRooms is a non-optional Int. The fact that it’s queried through an optional chain means that the call to numberOfRooms will always return an Int? instead of an Int.

Because this version of Residence stores an array of Room instances, its numberOfRooms property is implemented as a computed property, not a stored property. The computed numberOfRooms property simply returns the value of the count property from the rooms array.

As a shortcut to accessing its rooms array, this version of Residence provides a read-write subscript that provides access to the room at the requested index in the rooms array.

This version of Residence also provides a method called printNumberOfRooms, which simply prints the number of rooms in the residence.

Finally, Residence defines an optional property called address, with a type of Address?. The Address class type for this property is defined below.

The Room class used for the rooms array is a simple class with one property called name, and an initializer to set that property to a suitable room name:

Accessing Properties Through Optional Chaining

As demonstrated in Optional Chaining as an Alternative to Forced Unwrapping, you can use optional chaining to access a property on an optional value, and to check if that property access is successful.

Use the classes defined above to create a new Person instance, and try to access its numberOfRooms property as before:

## Calling Methods Through Optional Chaining

You can use optional chaining to call a method on an optional value, and to check whether that method call is successful. You can do this even if that method doesn’t define a return value.

The printNumberOfRooms() method on the Residence class prints the current value of numberOfRooms. Here’s how the method looks:

func printNumberOfRooms() {
    print("The number of rooms is \(numberOfRooms)")
}
This method doesn’t specify a return type. However, functions and methods with no return type have an implicit return type of Void, as described in Functions Without Return Values. This means that they return a value of (), or an empty tuple.

If you call this method on an optional value with optional chaining, the method’s return type will be Void?, not Void, because return values are always of an optional type when called through optional chaining. This enables you to use an if statement to check whether it was possible to call the printNumberOfRooms() method, even though the method doesn’t itself define a return value. Compare the return value from the printNumberOfRooms call against nil to see if the method call was successful:

Note

When you access a subscript on an optional value through optional chaining, you place the question mark before the subscript’s brackets, not after. The optional chaining question mark always follows immediately after the part of the expression that’s optional.

The example above defines a dictionary called testScores, which contains two key-value pairs that map a String key to an array of Int values. The example uses optional chaining to set the first item in the "Dave" array to 91; to increment the first item in the "Bev" array by 1; and to try to set the first item in an array for a key of "Brian". The first two calls succeed, because the testScores dictionary contains keys for "Dave" and "Bev". The third call fails, because the testScores dictionary doesn’t contain a key for "Brian".

## Linking Multiple Levels of Chaining

You can link together multiple levels of optional chaining to drill down to properties, methods, and subscripts deeper within a model. However, multiple levels of optional chaining don’t add more levels of optionality to the returned value.

To put it another way:

If the type you are trying to retrieve isn’t optional, it will become optional because of the optional chaining.

If the type you are trying to retrieve is already optional, it will not become more optional because of the chaining.

Therefore:

If you try to retrieve an Int value through optional chaining, an Int? is always returned, no matter how many levels of chaining are used.

Similarly, if you try to retrieve an Int? value through optional chaining, an Int? is always returned, no matter how many levels of chaining are used.
