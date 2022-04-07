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
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // Used to dynamically display mission names and badges
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    // Convert the mission launch date to a string, if it exists
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "Failed to Launch"
        }
    }
    
    
}


