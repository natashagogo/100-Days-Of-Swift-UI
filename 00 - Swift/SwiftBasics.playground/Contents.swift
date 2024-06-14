import UIKit

// Checkpoint: Simple Data Types

let celsius = 40.0
let fahrenheit = ((celsius * 9) / 5) + 32
print("\(celsius)°C is \(fahrenheit)°F")


// Checkpoint: Complex Data Types

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

// Convert an array to a dictionary
let datesByMonth = Dictionary(grouping: dates, by: { Calendar.current.dateComponents([.month], from: $0) })

print(datesByMonth.keys.count)

