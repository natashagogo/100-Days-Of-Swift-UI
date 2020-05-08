//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Natasha Godwin on 5/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

extension Bundle {
    // <T> is short for 'type'
    // This function returns T, not [T] because we don't want to return the arrays (of astronauts, missions, etc.) inside another array
    // Whatever the type is, it must conform to Codable 
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        // Format dates
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
        
    }
}
