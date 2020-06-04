//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

// If you want to load a JSON file into a project ...
// 1. Use Bundle to find the path to the file
// 2. Load it into an instance of Data
// 3. Pass it through JSON Decoder
// All of this can be accomplished by writing an extension on Bundle.

// Generics allow you to use the same decode() method to load any JSON from the bundle into any Swift type that conforms to Codable. 

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
