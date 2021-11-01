//
//  Game.swift
//  DiceRoller
//
//  Created by Natasha Godwin on 10/31/21.
//

import Foundation

/*
TO DO:
This data model is okay, but it will create problems down the line because of the lack of UUIDs.
Break it down into two separate classes.
Use the HotProspects project for reference.
*/

class Game: ObservableObject {
	@Published var firstDice: Int = Int.random(in: 1...6)
	@Published var secondDice: Int = Int.random(in: 1...6)
	@Published var results: [[Int]] = []
	
	var total: Int {
		return firstDice + secondDice
	}
	
	
	func rollDice() {
		// objectWillChange.send()
		firstDice = Int.random(in: 1...6)
		secondDice = Int.random(in: 1...6)
		results.append([firstDice, secondDice])
	}

}
