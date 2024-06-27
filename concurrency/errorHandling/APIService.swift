enum APIService {
  enum APIError: Error {
    case tooEasy
    case tooShort
    case noPassword
  }
  
  static func login(_ password: String?) throws -> String {
    guard let password = password else { throw APIError.noPassword }
    guard password.count >= 8 else { throw APIError.tooShort }
    guard password.lowercased() != "password" else { throw APIError.tooEasy }
    return "Logged In"

  }
}
func login(with password: String) {
    do {
      let status = try APIService.login(password)
      print(status)
    } catch {
      print(error)
    }
}
login(with: "password")
login(with: "pass")
login(with: "Great password")
print()


func logins(with password: String) {
    guard let status = try? APIService.login(password) else {
      print("Login Failed!")
      return
    }
    print(status)
}
logins(with: "password")
logins(with: "pass")
logins(with: "Great password")
logins(with: "Great4Password")
