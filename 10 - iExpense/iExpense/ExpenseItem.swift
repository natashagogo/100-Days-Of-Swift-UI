//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID() // generate a universally unique identifier
    var name: String
    var type: String
    var amount: Double
}


