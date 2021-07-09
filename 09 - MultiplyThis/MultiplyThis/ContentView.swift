//
//  ContentView.swift
//  MultiplyThis
//
//  Created by Natasha Godwin on 5/30/21.
//

import SwiftUI

class Game: ObservableObject {
    @Published var table = 5
    @Published var numberOfQuestions: Float = 10
    
    var questions: [String] {
        let sessionLength = 1...Int(numberOfQuestions)
        var question: String
        var questions = [String]()
        
        for _ in sessionLength {
            let randomNumber = Int.random(in: 1...12)
            question = "What is \(randomNumber) x \(table)?"
            questions.append(question)
        }
        return questions
    }
}

struct ContentView: View {
    @ObservedObject var game = Game()
    @State private var isActive = false
    var body: some View {
        NavigationView {
            Group {
                if isActive {
                    PlayGame(game: self.game)
                } else {
                    UpdateSettings(game: self.game)
                }
            }
            .navigationBarTitle(isActive ? "Game": "Settings")
            .navigationBarItems(trailing: Button(isActive ? "Settings": "Play") {
                self.isActive.toggle()
            })
        }
    }
    
}

struct UpdateSettings: View {
    @ObservedObject var game: Game
    var body: some View {
        Form {
            Section(header: Text("Practice")) {
                Stepper("\(game.table) tables", value: $game.table, in: 1...12)
            }
            Section(header: Text("Number of Questions")) {
                Text("\(game.numberOfQuestions, specifier: "%g") questions")
                Slider(value: $game.numberOfQuestions, in: 5...20, step: 5) {
                    Text("Number Of Questions")
                }
            }
        }
    }
}

struct PlayGame: View {
    @ObservedObject var game: Game
    
    var body: some View {
        ForEach(game.questions, id: \.self) { question in
            Text(question)
        }
    }
    
    func nextQuestion() {
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
