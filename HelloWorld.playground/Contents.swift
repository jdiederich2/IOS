//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let always4: Float = 4

print("Hello World")

print(str)

// Variables vs constants
//
// Use let for constants (immutable)
// Use var for variables (mutable)
//

let stuff = 10  // inferred data typing based on assigned valud

let label = "The width is "

let width = 94

let widthLabel = label + String(width)

let numApples = 3
let numOranges = 5

// Identifier (var or constant) interpolation (identifier gets replaced by the value it contains)
// inside a double-quoted string.

let appleSummary = "I have \(numApples) apples"
let fruitSummary = "I have \(numApples + numOranges) pieces of fruit"

print("\(always4) / 3.5 is \(always4 / 3.5)")

// Loops in swift
var n = 2

while n < 100 {
    n *= 2  // sames as n = n * 2
    print(n)
}

n


var m = 2

// repeat-while (same as do-while in other languages)
repeat {
    m *= 2
} while m < 100
m

// for-in loop (similar to foreach loops in other languages)
var sum = 0

// ... is a range operator in Swift and includes both bounds in the range
for i in 0...8 {
    sum += i
    print(sum)
}
sum

// Vector arrays whose indexes start and 0 and go up by 1
// var famousBattles = [String]()   // Declares an empty array

var famousBattles = ["gettysburg", "waterlou", "the Somme", "Gravelotte-St Privat", "Verdun", "Saigon"]

famousBattles[1] = "Waterloo"

famousBattles.append("Antietam")

famousBattles.insert("Endor", at: 1)

famousBattles.removeLast()  // Antietam replaces this line
// let lastBattle = famousBattles.removeLast()  lastBattle is now Antietam

famousBattles.remove(at: 3)

// Iterate through an array
for battle in famousBattles {  // Each time through the loop, battle is replaced with new value
    print("battle: \(battle)")
}

// Dictionary (associative array or hash). Keys (indexes) are strings.
var emptyDictionary = [String: Int]()   // Sring - datatype of key, Int - datatype of value
var anotherEmptyDictionary = Dictionary<String, Float>()

var bigfootNames = [
    "North America": "Sasquatch",
    "Ohio": "Grassman",
    "Himalayas": "Yeti",
    "Australia": "Yowie",
    "Florida": "Skunk Ape",
    "Wisconsin": "Cheese Monkey",
]

bigfootNames["Louisiana"] = "Rugaroo"  // Adds to array
bigfootNames["Florida"] = "Swamp Ape"  // Replaces the value of the key in the array

// Iterate throught a dictionary
for (region, name) in bigfootNames {
    print("Region: \(region), Name: \(name)")
}


// Get just the keys of a Dictionary
for (region) in bigfootNames.keys {
    print("Region: \(region)")
}

// Get just values of a Dictionary
for (name) in bigfootNames.values {
    print("Name: \(name)")
}

// If structures
let scores = [75, 43, 104, 87, 12]
var teamScore = 0

for score in scores {
    
    if score > 50 {
        teamScore += 3
    } else if score > 40 {
        teamScore += 1
    } else {
        teamScore -= 1
    }
}
teamScore

// Switches in swift support any kind of data (Objective-C only supported integers)
let vegetable = "red pepper"
// let vegetable = "brussel sprouts"

switch vegetable {
    case "celery":
        let comment = "Add some raisins and peanut butter to make ants on a log"
    
    case "cucumber", "watercress":
        let comment = "That would make a good teas sandwich"
    
    case let x where x.hasSuffix("pepper"):
        let comment = "Is it a spicy \(x)"
    
    default:
        let comment = "Everything tastes good in soup"
}


// Multidemensional Arrays
let coolNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8, 13, 21],
    "Squares": [1, 4, 9, 16, 25],
]

var largest = 0
var kindOfLargest = ""

// Iterate through the multidimensional array
for (kind, numbers) in coolNumbers {
    
    for number in numbers {
        if number > largest {
            largest = number
            kindOfLargest = kind
        }
    }
}

kindOfLargest
largest

// You know for sure that the number is not nil, tells swift to force unwarp
coolNumbers["Prime"]![2]

// Tuples are ordered lists of values. In other languages like pearl,
// they are called list literals...
let rectangle = (28, 72, 200, 100)

// Annotated Tuple
let circle = (x:30, y:45, radius:200)

// Pull our the individual values from a Tuple and store them in
// descriptive scaler identifiers (variables/constants).
// Below takes the values of circle and plugs them into the below Tuple
let (centerX, centerY, radius) = circle

centerX
centerY
radius

var (_, _, rectangleWidth, _) = rectangle

rectangleWidth

rectangle.0

// Functions in Swift
// Function definition
/*func greet(name:String, day:String) -> String {
    
    return "Hello \(name), today is \(day)"
} */

func greet(_ name:String, _ day:String) -> String {
    
    return "Hello \(name), today is \(day)"
}

// function calls requre parameter (argument) labels in Swift 3 unless
// the developer specifies otherwise...
greet("Bob", "Wednesday")


// Functions can take varying numbers of arguments (Parameters) and will
// collect them into an array
func calcAverage(numbers: Double...) -> Double {
    
    var sum: Double = 0
    
    for number in numbers {  // numbers is parameter variable
        sum += number
    }
    
    // Creating an instance of a double
    let howMany: Double = Double(numbers.count)
    
    return Double(sum / howMany)
}

calcAverage(numbers: 30, 40, 50)

calcAverage(numbers: 3, 8, 3)

// function parameter expects a list of double values. Cannot pass an array object
// or Tuple.
// let myNumbers = [1.0, 2.0, 3.0, 4.0]
// calcAverage(numbers: myNumbers)



// Optionals
//
// Use an optional when we are not sure that an identifier has a value
// present. This means that optionals can have an assigned value or no
// value at all. If an identifier isn't optional, we need to expect that it could
// contain nil, so we would need to be ready to handle that case using
// either optional binding (if let ...) or
// a guard statement.
var stuff2: String?

// Optional binding - Check stuff2 to make sure that it has something in it.
if let someConstantName = stuff2 {
    // Some code in here
} else {
    // stuff2 contains nil, do something else
}

// Use ! to explicitly or force unwrap and optional which tells the compiler
// that this identifier will have a non-nil value at the point it is used.
var stuff3: String!










