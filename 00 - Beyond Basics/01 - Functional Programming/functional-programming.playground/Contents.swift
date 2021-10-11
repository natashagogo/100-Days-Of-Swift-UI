import SwiftUI

/*

Principles of Functional Programming
1. Action: Use verbs, not nouns. Treat functions as first-class data types.
2. Modularity: Treat functions like legos: use small functions to create more complex behavior
3. Predictability: The same input must return the same output.
4. Immutability: Use immutable value types.
5. Containment: Avoid using state inside a function whenever possible.

Higher-order function
A function that accepts another function as a parameter

Pure function
A function that always returns the same output, given the same input, without affecting other functions, i.e. creating "side-effects).

*/


/*
.map()
A method that loops over a collection, applies the same function to each item, and returns the result in a new collection.

Advantages
- It's less code than a for loop.
- It's more efficient. The .map() method tells the compiler what to do, but not how to do it, so it can find more efficient ways to handle the operation.
- It's easier to read for other developers.

*/

let seasons = [
	"spring",
	"summer",
	"fall",
	"winter"
]

let semesters = seasons.map { "\($0.capitalized) 2021"}
print(semesters)







