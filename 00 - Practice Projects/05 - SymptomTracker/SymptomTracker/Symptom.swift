//
//  Symptom.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/2/21.
//

import Foundation

// The Equatable protocol checks whether two objects are the same

struct Symptom: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var date: String
    
    // This will only check the name property when comparing objects
    static func ==(first: Symptom, second: Symptom) -> Bool {
        return first.name == second.name
    }
}
