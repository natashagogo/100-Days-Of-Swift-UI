//
//  Card.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/21/21.
//

import Foundation

struct Card {
	let prompt: String
	let answer: String
	static var example: Card {
		Card(
			prompt: "What's cooler than being cool?",
			answer: "Ice cold"
		)
	}
}
