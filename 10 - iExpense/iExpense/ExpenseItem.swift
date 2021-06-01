//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Natasha Godwin on 6/1/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
