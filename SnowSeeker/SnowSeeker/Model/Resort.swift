//
//  Resort.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/3/21.
//

import Foundation

struct Resort: Identifiable, Codable {
	var id: String
	var name: String
	var country: String
	var description: String
	var imageCredit: String
	var price: Int
	var size: Int
	var snowDepth: Int
	var elevation: Int 
	var runs: Int 
	var facilities: [String]
	
	static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
	static let example = allResorts[0] // load the first one
}
