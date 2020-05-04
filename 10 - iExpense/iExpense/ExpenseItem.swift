//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/4/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

// Codable generates the code you need to archive and unarchive objects
struct ExpenseItem: Identifiable, Codable {
    let id = UUID() // generates a universally unique id 
    let name: String
    let type: String
    let amount: Double
}
