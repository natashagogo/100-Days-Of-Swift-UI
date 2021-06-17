//
//  EventList.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/3/21.
//

import Foundation

class EventList: ObservableObject {
    @Published var list = [Event]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(list) {
                UserDefaults.standard.set(encoded, forKey: "List")
            }
        }
    }
    
    init() {
        if let list = UserDefaults.standard.data(forKey: "List") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Event].self, from: list) {
                self.list = decoded
                return
            }
        }
        self.list = []
    }
}
