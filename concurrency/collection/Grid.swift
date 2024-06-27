// consider a GridPoint type that describes a location in a grid of buttons. 
// Here’s the initial declaration of the GridPoint type:

/// A point in an x-y coordinate system.
struct GridPoint {
    var x: Int
    var y: Int
}

/**
You’d like to create a set of the grid points where a user has already tapped. Because the GridPoint type is not hashable yet, it can’t be used in a set. To add Hashable conformance, provide an == operator function and implement the hash(into:) method.
*/

extension GridPoint: Hashable {
    static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

/**
The hash(into:) method in this example feeds the grid point’s x and y properties into the provided hasher. These properties are the same ones used to test for equality in the == operator function.
Now that GridPoint conforms to the Hashable protocol, you can create a set of previously tapped grid points.
*/
var tappedPoints: Set = [GridPoint(x: 2, y: 3), GridPoint(x: 4, y: 1)]
let nextTap = GridPoint(x: 0, y: 1)
if tappedPoints.contains(nextTap) {
    print("Already tapped at (\(nextTap.x), \(nextTap.y)).")
} else {
    tappedPoints.insert(nextTap)
    print("New tap detected at (\(nextTap.x), \(nextTap.y)).")
}
// Prints "New tap detected at (0, 1).")