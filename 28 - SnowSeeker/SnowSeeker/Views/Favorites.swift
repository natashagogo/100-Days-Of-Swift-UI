//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/4/21.
//

import Foundation


class Favorites: ObservableObject {
	private var resorts: Set<String>
	private let saveKey = "Favorites"
	
	init() {
		// Load data
		// 1. Read the key from UserDefaults
		if let data = UserDefaults.standard.data(forKey: saveKey) {
			// 2. Create an instance of JSONDecoder
			let decoder = JSONDecoder()
			// Convert JSON to Resort objects
			if let decoded = try? decoder.decode(Set<String>.self, from: data) {
				self.resorts = decoded
				return
			}
				
		}
		self.resorts = []
	}
	
	// returns true if the set contains this resort
	func contains(_ resort: Resort) -> Bool {
		resorts.contains(resort.id)
	}
	
	// adds a resort to the set, updates all views, and saves changes
	func add(_ resort: Resort) {
		objectWillChange.send()
		resorts.insert(resort.id)
		save()
	}
	
	// removes a resort from the set, updates all views, and saves changes
	func remove(_ resort: Resort) {
		objectWillChange.send()
		resorts.remove(resort.id)
		save()
	}
	
	func save() {
		// write out the data
		let encoder = JSONEncoder()
		if let encoded = try? encoder.encode(resorts) {
			UserDefaults.standard.set(encoded, forKey: saveKey)
		}
	}
	
}
