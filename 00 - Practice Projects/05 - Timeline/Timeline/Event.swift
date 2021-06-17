//
//  Event.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/3/21.
//

import Foundation

struct Event: Identifiable, Codable {
    let id = UUID()
    let text: String
    let date: String
}
