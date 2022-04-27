//
//  ContentView.swift
//  WordScramble
//
//  Created by Natasha Godwin on 5/24/21.
//

import SwiftUI

/*
 START HERE
 
 Write an extension on Bundle to load any kind of file into an app
 Create a data model for the game and add the methods below to it
 */


struct ContentView: View {
	@State private var usedWords = [String]()
	@State private var rootWord = ""
	@State private var newWord = ""
	
	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showingError = false
	
    var body: some View {
		 NavigationView {
			 List {
				 Section {
					 TextField("Enter your word", text: $newWord, onCommit: addNewWord)
						 .autocapitalization(.none)
				 }
				 Section {
					 ForEach(usedWords, id: \.self) { word in
						 HStack {
							 Image(systemName: "\(word.count).circle.fill")
								 .foregroundColor(word.count > 5 ? Color.blue: Color.gray)
	
							 Text(word)
						 }
					 }
				 }
			 }
			 .navigationTitle(rootWord)
			 .onSubmit(addNewWord)
			 .onAppear(perform: startGame)
			 .alert(errorTitle, isPresented: $showingError) {
				  Button("OK", role: .cancel) { }
			 } message: {
				  Text(errorMessage)
			 }
		 }
    }
	
	func addNewWord() {
		let word = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		
		guard word.count > 0 else { return }
		
		guard isOriginal(word: word) else {
			 wordError(title: "Word used already", message: "Try something new!")
			 return
		}

		guard isPossible(word: word) else {
			 wordError(title: "Word not possible", message: "Only use letters in '\(rootWord)'!")
			 return
		}

		guard isReal(word: word) else {
			 wordError(title: "Word not recognized", message: "Say what, Shakespeare?")
			 return
		}
		
		withAnimation {
			usedWords.insert(word, at: 0)
		}
		newWord = ""
	}
	
	func startGame() {
		// Find the URL for start.txt in our app
		if let startURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			// Load the file into a string
			if let words = try? String(contentsOf: startURL) {
				// Split the string into an array of strings
				let allWords = words.components(separatedBy: "\n")
				// Pick one random word
				rootWord = allWords.randomElement() ?? "hyena"
				
				return
			}
		}
		// If there was an error, crash the app
		fatalError("Couldn't load start.txt from bundle.")
	}
	
	// Verifies that the player hasn't already used the word
	func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
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
	
	func wordError(title: String, message: String) {
		 errorTitle = title
		 errorMessage = message
		 showingError = true
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
