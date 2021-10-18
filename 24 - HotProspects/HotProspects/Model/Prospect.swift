//
//  Prospect.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/6/21.
//

import SwiftUI

enum PersistenceType {
	 case userDefaults, fileManager
}

// This is a class, not a struct, so instances of the class can be updated directly and shared with other views.
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
	
	static let saveKey = "SavedData" // For userDefaults
	static let fileName = "SavedDataAlternative"  // For FileManager
	
	let persistenceType: PersistenceType = .fileManager
	
	init() {
		self.people = []
		
		// Load data
		switch self.persistenceType {
		case .userDefaults:
			if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
				if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
					self.people = decoded
					return
				}
			}
		case .fileManager:
			//Create a blank file, if one doesn't exist
			if !FileManager.fileAlreadyExists(Self.fileName), let encodedProspects = try? JSONEncoder().encode(self.people) {
				 FileManager.writeTo(content: encodedProspects, fileName: Self.fileName)
			}
			
			let peopleData = FileManager.dataContentsOf(fileName: Self.fileName)
			let decoder = JSONDecoder()
			if let decodedPeople = try? decoder.decode([Prospect].self, from: peopleData) {
				 self.people = decodedPeople
				 return
			}
		}
	}
	
	// Write data
	// This will only be called inside the Prospects class, so it's marked private
	private func save() {
		switch self.persistenceType {
		case .userDefaults:
			if let encoded = try? JSONEncoder().encode(people) {
				UserDefaults.standard.set(encoded, forKey: Self.saveKey)
			}
		case .fileManager:
			let encoder = JSONEncoder()
			if let encodedProspects = try? encoder.encode(self.people) {
			  FileManager.writeDataTo(content: encodedProspects, fileName: Self.fileName)
			}
		}
	}
	
	func add(_ prospect: Prospect) {
		people.append(prospect)
		save()
	}
	
	/*
    Any items in the array that are changed won't trigger an update.
	 This method allows users to change the contact status for each person
	 and sends out a change notification when one is made.
   */
	
	func toggle(_ prospect: Prospect) {
		objectWillChange.send()
		prospect.isContacted.toggle()
		// Save changes
		save()
	}
	

}
