//
//  GameHistory.swift
//  WordScramble
//
//  Created by Natasha Godwin on 4/29/22.
//

import SwiftUI

class GameHistory: ObservableObject {
	@Published var sessions = [Game]()
	
	var numberOfSessions: Int {
		sessions.count
	}
	
	var totalPoints: Int {
		sessions.reduce(0) { $0 + $1.points }
	}
	
	
	func startNewGame(game: Game) {
		var game = Game()
		// Find the URL for start.txt in our app
		if let startURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			// Load the file into a string
			if let words = try? String(contentsOf: startURL) {
				// Split the string into an array of strings
				let allWords = words.components(separatedBy: "\n")
				// Pick one random word
				game.rootWord = allWords.randomElement() ?? "hyena"
				game.round = sessions.isEmpty ? 1 : sessions.count + 1
				
				return
			}
		}
		// If there was an error, crash the app
		fatalError("Couldn't load start.txt from bundle.")
	
	}
	

}
