# string

let actor = "Denzel Washington"

let nameLength = actor.count
print(nameLength)
print()

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))
print()

let result = "⭐️ You win! ⭐️"
print(result.uppercased())
print()

let movie = """
A day in
the life of an
Apple engineer
"""
print(movie.hasPrefix("A day"))
print()

let number = 120
print(number.isMultiple(of: 3))
print()

print(120.isMultiple(of: 3))
print()

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)
print()

var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)
print()

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart
print(greeting)
print()

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)
print()

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)
print()

let quote = "Then he tapped a sign saying \"Believe\" and walked away."
print(quote)

print("5 x 5 is \(5 * 5)")

let character = "R"
let string = "Hello, \(character)osa!"
// string == "Hello, Rosa!"

let string2 = "Hello, \(name)!"
// string2 == "Hello, Rosa!"

```s
  "editor.tokenColorCustomizations": {
    "textMateRules": [
      {
        "name": "Comment",
        "scope": [
          "comment",
          "comment.block",
          "comment.block.documentation",
          "comment.line",
          "comment.line.double-slash",
          "punctuation.definition.comment"
        ],
        "settings": {
          "fontStyle": "italic"
        }
      }
    ]
  },
  ```
