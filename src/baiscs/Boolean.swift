/**
* Boolean type,The types of orangesAreOrange and turnipsAreDelicious have been inferred 
* as Bool from the fact that they were initialized with Boolean literal values. 
* As with Int and Double above, you don’t need to declare constants or variables 
* as Bool if you set them to true or false as soon as you create them. 
* Type inference helps make Swift code more concise and readable when it initializes constants or 
* variables with other values whose type is already known
*/
let orangesAreOrange = true
let turnipsAreDelicious = false

// Boolean values are particularly useful when you work with conditional statements such as the if statement:
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

if orangesAreOrange{
  print("Mmm, tasty oranges!")
}else{
  print("Eww, oranges are horrible.")
}
print()

// maximumNumberOfLoginAttempts has no value yet.
var environment = "development"
let maximumNumberOfLoginAttempts: Int

if environment == "development" {
    maximumNumberOfLoginAttempts = 100
} else {
    maximumNumberOfLoginAttempts = 10
}
// Now maximumNumberOfLoginAttempts has a value, and can be read.
print("NumberOfLoginAttempts \(maximumNumberOfLoginAttempts)")
print()
