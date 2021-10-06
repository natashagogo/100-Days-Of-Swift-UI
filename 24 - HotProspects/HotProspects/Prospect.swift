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
	var isContacted = false
}

class Prospects: ObservableObject {
	@Published var people: [Prospect]
	
	init() {
		self.people = []
	}
}
