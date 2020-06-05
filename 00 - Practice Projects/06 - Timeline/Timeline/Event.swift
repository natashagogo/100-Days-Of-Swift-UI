//
//  Event.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

struct Event: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
    let date: Date
    
    var formatDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
