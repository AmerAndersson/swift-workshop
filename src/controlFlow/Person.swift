
struct Person {
  var age: Int 
  var name: String
  var gender: Gender
  var skills: [Skills]

  enum Gender {
    case male, female
  }
  enum Skills: String {
    case uikit, objc, kotlin, swiftui, swift, dart
  }
}

print("Example 1 - Nested If") 
let mary = Person(age: 21, name: "Mary", gender: .female, skills: [.swift, .swiftui])
func shouldInterView(_ person: Person) -> Bool {
  if person.age > 20 {
    if person.gender == .female {
      if person.skills.contains(.swiftui) {
        return true
      }
    }
  }
  return false
}
print(shouldInterView(mary))


print("Example 2 - Guard...else") 
let mary2 = Person(age: 21, name: "Mary", gender: .female, skills: [.swift, .swiftui])
func shouldInterView2(_ person: Person) -> Bool {
  guard person.age > 20 else { return false}
  guard person.gender == .female else { return false}
  guard person.skills.contains(.swiftui) else { return false}
  return true
}
print(shouldInterView2(mary2))

print("Example 3 - If...else") 
let mary3 = Person(age: 21, name: "Mary", gender: .female, skills: [.swift, .swiftui])
func shouldInterView3(_ person: Person) -> Bool {
  if person.age < 20 { return false}
  if person.gender != .female { return false}
  if !person.skills.contains(.swiftui) { return false}
  return true
}
print(shouldInterView3(mary3))