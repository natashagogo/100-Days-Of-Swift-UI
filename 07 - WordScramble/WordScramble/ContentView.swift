//
//  ContentView.swift
//  WordScramble
//
//  Created by Natasha Godwin on 5/24/21.
//

import SwiftUI

/*
 TO DO:
   Show the number of points the user got for each word.
 */


struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var points = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Score: \(points)")
                    .font(.headline)
                    .foregroundColor(.blue)

                List(usedWords, id: \.self) { word in
						HStack {
							Image(systemName: "\(word.count).circle")
							Text(word)
						}
						.accessibilityElement(children: .ignore)
						.accessibility(label: Text("\(word), \(word.count) letters"))
                }
                
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .navigationBarItems(trailing: Button(action: startGame) {
                Text("Next")
            })
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func startGame() {
        // 1. Find start.txt
        if let starterWordsFile = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let starterWords = try? String(contentsOf: starterWordsFile) {
                // 3. Split the string into an array of strings
                let allWords = starterWords.components(separatedBy: "\n")
                // 4. Get a random word (or otherwise use silkworm)
                rootWord = allWords.randomElement() ?? "silkworm"
                // Exit, if successful
                return
            }
        }

        // If there's an error loading the file, make the app crash.
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        // Lowercase and trim the word
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Exit if the string is empty
        guard answer.count > 0 else {
           return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Use a different word!", message: "Don't repeat yourself or the prompt.")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Not quite!", message: "Make sure your letters exist in the starter word.")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Say what?", message: "Sorry, Shakespeare, you can't make up words!")
            return
        }
        
        guard isSufficient(word: answer) else {
            wordError(title: "Too short!", message: "Choose a word that's at least three letters long.")
            return
        }
        
        // Add word to usedWords array
        usedWords.insert(answer, at: 0)
        calculateScore(word: answer)
        newWord = ""
        
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word) && word != rootWord
    }
    
    func isPossible(word: String) -> Bool {
        var starterWordCopy = rootWord
        
        for letter in word {
            if let position = starterWordCopy.firstIndex(of: letter) {
                starterWordCopy.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let errorFound = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return errorFound.location == NSNotFound
    }
    
    func isSufficient(word: String) -> Bool {
        word.count >= 3
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func calculateScore(word: String) {
        let count = word.count
        
        switch count {
          case 3...4:
            points += 1
          case 5...6:
            points += 2
          case 8...:
            points += 3
          default:
            points += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
