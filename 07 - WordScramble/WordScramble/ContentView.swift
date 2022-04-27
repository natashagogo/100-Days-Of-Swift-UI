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
		 }
    }
	
	func addNewWord() {
		let word = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		
		guard word.count > 0 else { return }
		
		withAnimation {
			usedWords.insert(word, at: 0)
		}
		newWord = ""
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
