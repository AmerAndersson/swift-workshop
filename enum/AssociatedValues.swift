 // The `success` case has an associated value of type `String`
 // The `failure` case has an associated value of type `Error`
  
enum Result {
    case success(String) // Associated value of type String
    case failure(Error)  // Associated value of type Error
}

let successResult = Result.success("Data loaded successfully")
let failureResult = Result.failure(NetworkError.timeout)
  
// You can access the associated value using a `switch` statement or pattern matching.
switch successResult {
    case .success(let message):
        print("Success: \(message)")
     case .failure(let error):
         print("Failure: \(error.localizedDescription)")
     }
     
/**
In summary, associated values allow enums to represent a wide range of data by attaching specific information to each case. They make enums more flexible and expressive in Swift programming. If you have any further questions, feel free to ask! 😊
*/