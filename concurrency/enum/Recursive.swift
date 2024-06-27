/// Recursive Enumerations
/// A recursive enumeration is an enumeration that has another instance of the enumeration
/// as the associated value for one or more of the enumeration cases. 
/// You indicate that an enumeration case is recursive by writing indirect before it,
/// which tells the compiler to insert the necessary layer of indirection.
/// Here is an enumeration that stores simple arithmetic expressions:

/// Recursive Enumerations in Action
/// Write indirect before the beginning of the enumeration to enable indirection 
/// for all of the enumeration’s cases that have an associated value:
/// This enumeration can store three kinds of arithmetic expressions: a plain number,
/// the addition of two expressions, and the multiplication of two expressions

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
/// The addition and multiplication cases have associated values that are also arithmetic expressions 
/// — these associated values make it possible to nest expressions.The expression (5 + 4) * 2 has a number 
/// on the right-hand side of the multiplication and another expression on the left-hand side of the multiplication.
/// Because the data is nested, the enumeration used to store the data also needs to support nesting 
/// — this means the enumeration needs to be recursive.The code below shows the ArithmeticExpression recursive enumeration
/// being created for (5 + 4) * 2:
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

/// A recursive function is a straightforward way to work with data that has a recursive structure.
/// Here’s a function that evaluates an arithmetic expression:
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print("Product = \(evaluate(product))")

/// This function evaluates a plain number by simply returning the associated value. 
/// It evaluates an addition or multiplication by evaluating the expression on the left-hand side,
/// evaluating the expression on the right-hand side, and then adding them or multiplying them.
 