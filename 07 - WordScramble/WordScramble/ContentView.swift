//
//  ContentView.swift
//  WordScramble
//
//  Created by Natasha Godwin on 5/24/21.
//

import SwiftUI


struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle") // use SF Symbols to show the length of each word
                    Text($0)
                }
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
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
            wordError(title: "Try something new!", message: "You already used that word.")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Say what?", message: "Are you sure that's a word?")
            return
        }
        
        guard isEnglish(word: answer) else {
            wordError(title: "Not in this English", message: "That isn't a word in the English language.")
            return
        }
        
        // Add word to usedWords array
        usedWords.insert(answer, at: 0)
        newWord = ""
        
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
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
    
    func isEnglish(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let errorFound = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return errorFound.location == NSNotFound
        
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
