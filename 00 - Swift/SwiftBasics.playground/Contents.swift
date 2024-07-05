import UIKit

// Checkpoint: Simple Data Types
// Convert celsius to fahrenheit.

let celsius = 40.0
let fahrenheit = ((celsius * 9) / 5) + 32
print("\(celsius)°C is \(fahrenheit)°F")


// Checkpoint: Complex Data Types
// Count the items and unique items in an array.

extension Date {
    init(month: Int, day: Int, year: Int) {
        var components = DateComponents()
        components.month = month
        components.day = day
        components.year = year
        
        self = Calendar.current.date(from: components) ?? Date.now
    }
}

let dates = [
    Date(month: 3, day: 11, year: 2015),
    Date(month: 3, day: 11, year: 2015),
    Date(month: 3, day: 11, year: 2015),
    Date(month: 3, day: 21, year: 2019),
    Date(month: 3, day: 21, year: 2019),
    Date(month: 6, day: 12, year: 2019),
    Date(month: 3, day: 21, year: 2019),
    Date(month: 6, day: 12, year: 2019),
]

// Count items
print(dates.count)

// Count unique items
print(Set(dates).count)

// Checkpoint 3: Loops (FizzBuzz)
// Loop over 100 numbers and print out whether they are multiples of 3 and 5, just 3, or 5. 

for number in 1...100 {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if number.isMultiple(of: 3) {
        print("Fizz")
    } else if number.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(number)
    }
}

// Checkpoint 4: Functions
// Write a function that returns the square root of an Int between 1 and 10,000.
// If the number is less than 1 or greater than 10,000 throw an error.

enum BoundsError: Error {
    case tooLow, tooHigh, notFound
}

func squareRoot(of number: Int) throws -> Int {
    // The square root of the highest number, 10_000, is 100.
    let highestSquare = 100
    
    if number < 1 {
        throw BoundsError.tooLow
    }
    
    if number > 10_000 {
        throw BoundsError.tooHigh
    }
    
    for i in 1...100 {
        let squared = i * i
        
        if squared == number {
            return i
        }
    }
    
    throw BoundsError.notFound
}

do {
    try print(squareRoot(of: 25))
} catch {
    print("No square root was found.")
}

// Checkpoint 5: Closures
// Without using temporary variables:
// 1. Filter out even numbers
// 2. Sort the array in ascending order
// 3. Map them to strings
// 4. Print the result, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers.filter({ $0.isMultiple(of: 2) == false}).sorted().map({ "\($0) is a lucky number." })

for sentence in result {
    print(sentence)
}

// Checkpoint 6: Access Control
// Create a struct to store information about a bank account.

struct BankAccount {
    private(set) var name: String = "New Account"
    private(set) var funds = 0 // This can't be updated outside the struct.
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
    
}

var account = BankAccount()

account.deposit(amount: 100)
print(account.funds)
