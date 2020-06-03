//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

// If you want to use a JSON file ...
// 1. Use Bundle to find the path to the file
// 2. Load it into an instance of Data
// 3. Pass it through JSON Decoder
// All of this can be accomplished by writing an extension on Bundle. 

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
