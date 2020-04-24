//
//  ContentView.swift
//  WordScramble
//
//  Created by Natasha Godwin on 4/23/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// Room for improvement
// 1. Allow users to drag individual letters from rootWord to form a new word, instead of typing

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    @State private var pointPerWord = ""
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                List(usedWords, id: \.self) {
                    Text($0)
                    Image(systemName: "\($0.count).circle")
                    Spacer()
                    Text("\(self.pointPerWord)")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                
                Text("Points: \(score)")
                    .font(.title)
                    .foregroundColor(.blue)
                
            }
            .navigationBarTitle(rootWord)
            .navigationBarItems(trailing: Button(action: {
                self.startGame()
            }) {
                Text("Next")
            })
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage))
            }
        }
    }
    
    func startGame() {
        // 1. Find the URL for start.txt
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array
                let allWords = startWords.components(separatedBy: "\n")
                // 4. Pick one random word
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // exit
                return
            }
        }
        // If there's a problem, make the app crash
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        // lowercase and trim the word
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }
        
        // Validate word
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Pick something different!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can only use the letters in the word.")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Not a real word", message: "Sorry, Shakespeare, you can't make up words!")
            return
        }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "Too short", message: "Each word must be longer than three letters. Prefixes don't count!")
            return
        }
        
        // put word at the top of the list
        usedWords.insert(answer, at: 0)
        calculateScore(word: answer)
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word) && word != rootWord
    }
    
    // Limit users to using the letters in the root word
    func isPossible(word: String) -> Bool {
        // copy rootWord
        var tempWord = rootWord
        
        // Loop over each letter of the user's word
        for letter in word {
            // if a letter matches one in rootWord, remove it
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    // Make sure the word exists in the English language
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    // Make sure the word is longer than 3 letters
    func isLongEnough(word: String) -> Bool {
        word.count >= 3
    }
    
    // If there's an error, show a message
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func calculateScore(word: String) {
        let count = word.count
        
        switch count {
          case 3...5:
            score += 1
            pointPerWord = "1 point"
          case 6...8:
            score += 2
            pointPerWord = "2 points"
          default:
            score += 1
            pointPerWord = "1 point"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
