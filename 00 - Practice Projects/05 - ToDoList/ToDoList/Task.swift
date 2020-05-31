//
//  Task.swift
//  ToDoList
//
//  Created by Natasha Godwin on 5/31/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

struct Task: Identifiable, Codable {
    let id = UUID()
    let name: String
    let project: String
    let priority: String
}
