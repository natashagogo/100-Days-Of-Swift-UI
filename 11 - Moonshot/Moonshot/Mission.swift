//
//  Mission.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/4/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    // Each mission contains an array of crew members.
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}


