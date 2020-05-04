//
//  Expenses.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/4/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            // Convert data to JSON
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // Read data from UserDefaults, using the key "Items"
        if let items = UserDefaults.standard.data(forKey: "Items") {
            // Create an instance of JSONDecoder
            let decoder = JSONDecoder()
            // Convert JSON data into an array of Swift objects
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                // If successful, store that array in items
                self.items = decoded
                return
            }
        }
        // If unsuccessful, return an empty array.
        self.items = []
    }
}
