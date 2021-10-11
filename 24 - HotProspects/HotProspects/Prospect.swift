//
//  Prospect.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/6/21.
//

import SwiftUI

/*
 This is a class, rather than a struct, so instances of the class can be updated directly and shared with other views.
*/

class Prospect: Identifiable, Codable {
	let id = UUID()
	var name = "Anonymous"
	var emailAddress = ""
	// The fileprivate(set) keyword means this property can be read by any view,
	// but only written from the current file
	fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
	/*
   private(set) prevents external objects from writing to the array directly.
	Objects will need to call the add() method below to make any changes.
   */
	@Published private(set) var people: [Prospect]
	static let saveKey = "SavedData" 
	
	init() {
		// Load data from UserDefaults
		if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
			if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
				self.people = decoded
				return
			}
		}
		self.people = []
	}
	
	// Write data to UserDefaults
	// This will only be called inside the Prospects class, so it's marked private
	private func save() {
		if let encoded = try? JSONEncoder().encode(people) {
			UserDefaults.standard.set(encoded, forKey: Self.saveKey)
		}
	}
	
	func add(_ prospect: Prospect) {
		people.append(prospect)
		save()
	}
	
	/*
    Any items in the people array that are changed won't trigger an update.
	 This method allows users to change the contact status for each person
	 and sends out a change notification when one is made.
   */
	
	func toggle(_ prospect: Prospect) {
		// This has to be called before the actual change to ensure SwiftUI gets the animations correct.
		objectWillChange.send()
		prospect.isContacted.toggle()
		// Save changes
		save()
	}
	
	
}
