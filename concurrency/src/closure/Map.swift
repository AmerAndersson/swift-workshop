/// We want to square each number. We can use map to achieve this:
let numbers = [1, 2, 3, 4, 5]
let squared = numbers.map { $0 * $0 }
print("The squared: \(squared)") // [1, 4, 9, 16, 25]


/// The filter method allows you to extract elements from an array
/// or dictionary that satisfy a given condition. 
/// It returns a new collection containing only the elements that meet the specified criteria.
/// Filtering out negative numbers from an array of integers:
let numberFilter = [2, -5, 10, -3, 7]
let positiveNumbers = numberFilter.filter { $0 > 0 }
/// Result: [2, 10, 7]
print("Filter number: \(positiveNumbers)")

/// Filtering out empty strings from an array of strings:
let words = ["apple", "", "banana", "", "cherry"]
let nonEmptyWords = words.filter { !$0.isEmpty }
/// Result: ["apple", "banana", "cherry"]
print("Filter word: \(nonEmptyWords)")

/// Filtering out odd numbers from an array
let integers = [1, 2, 3, 4, 5, 6]
let evenNumbers = integers.filter { $0 % 2 == 0 }
/// Result: [2, 4, 6]
print("Filter even: \(evenNumbers)")

/// The reduce method combines all elements of a sequence into a single value.
/// It takes an initial value and a closure that specifies how to accumulate the result.
/// Summing an array of numbers
let numbersReduce = [1, 2, 3, 4, 5, 6, 7, 8]
let sum = numbersReduce.reduce(0, +)
// Result: 35
print("The sum: \(sum)")

/// Product of an array of numbers
let factors = [2, 3, 4]
let product = factors.reduce(1, *)
// Result: 24
print("The product: \(product)")

/// Flattening a nested array and calculating the sum
let nestedArray = [[1, 2], [3, 4], [5, 6]]
let totalSum = nestedArray.reduce(0) { $0 + $1.reduce(0, +) }
// Result: 21
print("Total: \(totalSum)")