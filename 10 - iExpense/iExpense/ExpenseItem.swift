//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/27/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
