//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/4/21.
//

import Foundation

/*
 This code converts JSON into an array of Swift objects in 3 steps:
    1. Uses Bundle to find each file
    2. Loads it into an instance of Data
    3. Passes it through JSON Decoder
 */

extension Bundle {
    func decode(_ file: String) -> [Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([Astronaut].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
