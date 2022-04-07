//
//  ContentView.swift
//  MultiplyThis
//
//  Created by Natasha Godwin on 5/30/21.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    var text: String
    var answer: Int
}

class Game: ObservableObject {
    @Published var tableSelected = 5
    @Published var numberOfQuestions = 10
    @Published var questions = [Question]().shuffled()
    
    func getQuestions()  {
        let sessionLength = 1...numberOfQuestions

        for _ in sessionLength {
           let randomElement = Int.random(in: 1...12)
            let question = "What is \(randomElement) x \(tableSelected)?"
            let correctAnswer = randomElement * tableSelected
            
            questions.append(Question(text: question, answer: correctAnswer))
        }
    }
    
    var randomQuestion: Question {
        return questions.randomElement() ?? Question(text: "Oops! There was a problem loading your question", answer: 0)
    }
}

struct ContentView: View {
    @ObservedObject var game = Game()
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            Group {
              if isActive == true {
                  GameView(game: self.game)
              } else {
                  SettingsView(game: self.game)
          }
         }
          .navigationBarTitle(isActive ? "Game": "Settings")
            .navigationBarItems(trailing: Button(isActive ? "Settings": "Play") {
                isActive.toggle()
            })
        }
    }
}
    

struct SettingsView: View {
    @ObservedObject var game: Game
    
    var body: some View {
        Form {
            Section(header: Text("Tables To Practice")) {
                Stepper("\(game.tableSelected) tables", value: $game.tableSelected, in: 1...12)
            }
            Section(header: Text("Number of Questions")) {
                Stepper("\(game.numberOfQuestions)", value: $game.numberOfQuestions, in: 1...20)
            }
        }
    }
}

struct GameView: View {
    @ObservedObject var game: Game
    @State private var questionNumber = 0
    @State private var response = ""
    
    @State private var points = 0

    
    var body: some View {
        VStack {
            // TO DO: Show one question
            Text("Points: \(points)")
            Text(game.randomQuestion.text)
            TextField("Your Answer", text: $response, onCommit: nextQuestion)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            Button("Next Question") {
                nextQuestion()
            }
            .disabled(questionNumber > game.numberOfQuestions)
        }
        .onAppear(perform: game.getQuestions)
        
    }
    
    func checkAnswer() {
        // TO DO - Check if the user's answer is correct
    }
    
    func nextQuestion() {
        questionNumber += 1
        
        if questionNumber <= game.numberOfQuestions  {
            game.questions.shuffle()
            response = ""
       }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
