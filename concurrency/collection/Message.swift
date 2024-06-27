/// Dictionaries
/// A collection whose elements are key-value pairs.
/// create a HTTP response codes and their related messages:
var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

/// print(responseMessages[200])
/// Prints "Optional("OK")"

/// create a set of HTTP response codes:
let httpResponseCodes = [200, 403, 404,500]
for code in httpResponseCodes {
    if let message = responseMessages[code] {
        print("Response \(code): \(message)")
    } else {
        print("Unknown response \(code)")
    }
}

/// Update an existing value
responseMessages[404] = "Not found"
responseMessages[500] = nil
print(responseMessages)
print("---------------------------------")

/// In a mutable Dictionary instance, you can modify in place a value that you’ve accessed through a keyed subscript. 
/// The code sample below declares a dictionary called interestingNumbers with string keys and values that are integer arrays,
/// then sorts each array in-place in descending order.

var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 17],
                          "triangular": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}

/// in descending order.
print(interestingNumbers["primes"]!)
/// Prints "[17, 13, 11, 7, 5, 3, 2]"

/// in ascending order
for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: <)
}
print(interestingNumbers["primes"]!)
print("---------------------------------")

/// Iterating Over the Contents of a Dictionary
let imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]

/// Decomposing each key-value pair into the elements of a tuple. 
for (name, path) in imagePaths {
    print("The path to '\(name)' is '\(path)'.")
}
print("---------------------------------")

/// search a dictionary’s contents for a particular value using the contains(where:) 
/// or firstIndex(where:) methods supplied by default implementation. 
// checks to see if imagePaths contains any paths in the "/glyphs" directory:

let glyphIndex = imagePaths.firstIndex(where: { $0.value.hasPrefix("/glyphs") })
if let index = glyphIndex {
    print("The '\(imagePaths[index].key)' image is a glyph.")
} else {
    print("No glyphs found!")
}
/// The index-based subscript returns the corresponding key-value pair as a non-optional tuple.
print(imagePaths[glyphIndex!])
// Prints "(key: "star", value: "/glyphs/star.png")"
print("---------------------------------")


var imagePath = [
    "icon.png": "/images/icons/icon.png",
    "logo.png": "/images/logos/logo.png",
    "glyphs/arrow.png": "/images/glyphs/arrow.png"
]

// Check if any value contains the "/glyphs" directory
let containsGlyphs = imagePath.contains { _, value in
    value.contains("/glyphs")
}

if containsGlyphs {
    print("The dictionary contains paths in the \"/glyphs\" directory.")
} else {
    print("No paths found in the \"/glyphs\" directory.")
}
print("---------------------------------")