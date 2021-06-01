//
//  Expenses.swift
//  iExpense
//
//  Created by Natasha Godwin on 6/1/21.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            // Create an instance of JSONEncoder
            let encoder = JSONEncoder()
            // Convert data to JSON
            if let encoded = try? encoder.encode(items) {
                // Write the data to UserDefaults
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // Read the "Items" key from UserDefaults
        if let items = UserDefaults.standard.data(forKey: "Items") {
            // Create an instance of JSONDecoder
            let decoder = JSONDecoder()
            // Convert JSON to ExpenseItem objects
            // Note: [ExpenseItem].self is used to refer to the type itself, so the compiler doesn't get confused.
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
