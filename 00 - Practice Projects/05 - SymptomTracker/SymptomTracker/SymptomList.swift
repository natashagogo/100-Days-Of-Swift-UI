//
//  SymptomList.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/2/21.
//

import Foundation

class SymptomList: ObservableObject {
    @Published var list = [Symptom]() {
        // This code will archive new symptoms
        didSet {
            // Create an instance of JSON Encoder
            let encoder = JSONEncoder()
            // Convert Swift objects to JSON
            if let encoded = try? encoder.encode(list) {
                // Write the data to UserDefaults
                UserDefaults.standard.set(encoded, forKey: "List")
            }
        }
    }
    
    // This code will unarchive symptoms
    init() {
        // If data with the key "List" can be found ...
        if let list = UserDefaults.standard.data(forKey: "List") {
            // Create an instance of JSON Decoder
            let decoder = JSONDecoder()
            // Convert the JSON data to an object of type Symptom
            if let decoded = try? decoder.decode([Symptom].self, from: list) {
                self.list = decoded
                return
            }
        }
        // If it fails, return an empty list.
        self.list = []
    }
}
