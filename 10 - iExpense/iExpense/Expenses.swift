//
//  Expenses.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/27/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // Attempt to read the "Items" key from UserDefaults
        if let items = UserDefaults.standard.data(forKey: "Items") {
            // Create an instance of JSONDecoder
            let decoder = JSONDecoder()
            // Convert the data received from UserDefaults into an array of ExpenseItem objects
            // We're using [ExpenseItem].self here to make it clear we're referring to the type itself
            // ... not creating an instance of the class, etc.
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                // If that works, add this array to items and exit.
                self.items = decoded
                return
            }
        }
        // Otherwise, set it to an empty array
        self.items = []
    }
}
