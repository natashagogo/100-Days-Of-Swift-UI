//
//  Result.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/26/21.
//

import Foundation

struct Result: Codable {
	let query: Query
}

struct Query: Codable {
	let pages: [Int: Page]
}

struct Page: Codable, Comparable {
	let pageid: Int
	let title: String
	let terms: [String: [String]]?
	
	// Sort by title
	static func < (lhs: Page, rhs: Page) -> Bool {
		 lhs.title < rhs.title
	}
	
	// Get information about each location
	/*
    Note: Wikipedia's JSON data contains a description for each place.
	 But it's buried in the terms dictionary, which may not exist for certain places.
	 If it does exist, it may not have a description key.
	 If it has a description key, it may not have a value.
   */
	var description: String {
		 terms?["description"]?.first ?? "No further information"
	}
	
	
}
