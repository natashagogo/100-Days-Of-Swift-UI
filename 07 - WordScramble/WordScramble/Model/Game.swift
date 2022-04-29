//
//  Game.swift
//  WordScramble
//
//  Created by Natasha Godwin on 4/29/22.
//

import SwiftUI

struct Game: Identifiable {
	var id = UUID()
	var usedWords = [String]()
	var rootWord: String = ""
	var newWord: String = ""
	
	var points: Int = 0
	var round: Int = 1
	var questionNumber: Double = 1
	
	var totalQuestions: Double = 10
	var feedback: Feedback = Feedback(title: "", message: "", isShowing: false)
	
	mutating func addNewWord() {
		let word = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		
		guard word.count > 0 else { return }
		
		guard isOriginal(word: word) else {
			feedback.giveFeedback(title: "Word used already", message: "Try something new!")
			 return
		}
		
		guard isSufficient(word: word) else {
			feedback.giveFeedback(title: "Too short!", message: "Each word needs to be at least three letters long.")
			 return
		}

		guard isPossible(word: word) else {
			feedback.giveFeedback(title: "Word not possible", message: "Only use letters in '\(rootWord)'!")
			 return
		}

		guard isReal(word: word) else {
			feedback.giveFeedback(title: "Word not recognized", message: "Say what, Shakespeare?")
			 return
		}
		
		withAnimation {
			usedWords.insert(word, at: 0)
			
			if word.count < 5 {
				points += 1
			} else {
				points += 2
			}
		}
		
		newWord = ""
	}
	
	// Verifies that the player hasn't already used the word
	// and that they're not using the word in the prompt
	func isOriginal(word: String) -> Bool {
		!usedWords.contains(word) && word != rootWord
	}
	
	func isSufficient(word: String) -> Bool {
		word.count >= 3
	}
	
	// Verifies that the player's word only uses letters from the prompt
	func isPossible(word: String) -> Bool {
		 var tempWord = rootWord

		 for letter in word {
			  if let position = tempWord.firstIndex(of: letter) {
					tempWord.remove(at: position)
			  } else {
					return false
			  }
		 }
		 return true
	}
	
	// Verifies that the word exists in English
	func isReal(word: String) -> Bool {
		 let checker = UITextChecker()
		 let range = NSRange(location: 0, length: word.utf16.count)
		 let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

		 return misspelledRange.location == NSNotFound
	}
	
	func isNextRound() -> Bool {
		questionNumber >= totalQuestions
	}
	
	mutating func byeNext() {
		if isNextRound() == false {
			questionNumber += 1
		} else {
			feedback.giveFeedback(title: "That's it!", message: "You scored \(points) points.")
			usedWords = [String]()
		}
	}
}
