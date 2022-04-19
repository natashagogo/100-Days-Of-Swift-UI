//
//  Game.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 4/19/22.
//

import Foundation

struct Game: Identifiable {
	var id = UUID()
	var round: Int
	var questionNumber: Double
	var totalQuestions: Double
	var points: Int
	
	enum Moves: String {
		case rock = "🪨 rock"
		case paper = "📃 paper"
		case scissors = "✂️ scissors"
	}
	
	static let moves: [Moves] = [
	  .rock,
	  .paper,
	  .scissors
	]
}
