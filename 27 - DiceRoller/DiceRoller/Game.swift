//
//  Game.swift
//  DiceRoller
//
//  Created by Natasha Godwin on 10/31/21.
//

import Foundation

class Game: ObservableObject {
	var id = UUID()
	var firstDice: Int = Int.random(in: 1...6)
	var secondDice: Int = Int.random(in: 1...6)
	
	var total: Int {
		return firstDice + secondDice
	}
	
	func rollDice() {
		objectWillChange.send()
		firstDice = Int.random(in: 1...6)
		secondDice = Int.random(in: 1...6)
	}
	
}
