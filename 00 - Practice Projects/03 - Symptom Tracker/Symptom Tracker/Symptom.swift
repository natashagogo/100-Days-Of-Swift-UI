//
//  Symptom.swift
//  Symptom Tracker
//
//  Created by Natasha Godwin on 5/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

// TO DO:
// Add a start date, a count, and a stepper

struct Symptom: Identifiable, Codable {
    let id = UUID()
    let name: String
}
