//
//  TaskList.swift
//  ToDoList
//
//  Created by Natasha Godwin on 5/31/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

class TaskList: ObservableObject {
    @Published var items = [Task]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Task].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}
