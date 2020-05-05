//
//  SymptomList.swift
//  Symptom Tracker
//
//  Created by Natasha Godwin on 5/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

class SymptomList: ObservableObject {
    @Published var list = [Symptom]() {
        didSet {
            let encoder = JSONEncoder()
            // Convert data to JSON
            if let encoded = try? encoder.encode(list) {
                // Store it in UserDefaults
                UserDefaults.standard.set(encoded, forKey: "List")
            }
        }
    }
    init() {
        // Read data from UserDefaults, using the key "List"
        if let list = UserDefaults.standard.data(forKey: "List") {
            let decoder = JSONDecoder()
            // Convert JSON data into an array of Swift objects
            if let decoded = try? decoder.decode([Symptom].self, from: list) {
                // If successful, store in an array
                self.list = decoded
                return
            }
        }
        // If that doesn't work, return an empty array
        self.list = []
    }
}
