//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 5/16/21.
//

import SwiftUI

/*
 
 TO DO:
 1. Improve the user experience: (1) Find another way to give feedback for right and wrong answers - save the alert for the end of the round (2) Add styling
 
 2. Find a cleaner way to handle alert messages.
 
 3. Clean up the code: (1) Use an enum instead of an array for the list of moves?
 
 
 */

struct ContentView: View {
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
  
    @State private var roundNumber = 1
    @State private var points = 0
    @State private var questionCount = 0
    
    @State private var giveFeedback = false
    @State private var feedback = (title: "", message: "")
    
    let moves = [
        "Rock",
        "Paper",
        "Scissors"
    ]
    
    
    var body: some View {
        VStack {
            Text("Question \(questionCount) of 10")
            HStack {
                Text("Round: \(roundNumber)")
                Text("Score: \(points)")
            }
            Text("\(moves[randomMove])")
            
            if shouldWin {
                Text("Win the game.")
            } else {
                Text("Lose the game.")
            }
            
            ForEach(moves, id: \.self) { move in
                Button(action: {
                    self.checkAnswer(selection: move)
                    self.giveFeedback.toggle()
                    self.nextQuestion()
                }) {
                    Text(move)
                }
            }
        }.alert(isPresented: $giveFeedback) {
            if questionCount == 10 {
                return Alert(title: Text("That's it!"), message: Text("You earned \(points) points in this round."), dismissButton: .default(Text("OK")) {
                    self.resetGame()
              })
            } else {
                return Alert(title: Text(feedback.title), message: Text(feedback.message), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func checkAnswer(selection: String) {
        let computerChoice = moves[randomMove]
        let userChoice = selection
        var correctAnswer: String
        
        let rock = moves[0]
        let paper = moves[1]
        let scissors = moves[2]
        
        if shouldWin {
            switch computerChoice {
              case rock:
                correctAnswer = paper
              case paper:
                correctAnswer = scissors
              case scissors:
                correctAnswer = rock
              default:
                correctAnswer = computerChoice
            }
        } else {
            switch computerChoice {
              case rock:
                correctAnswer = scissors
              case paper:
                correctAnswer = rock
              case scissors:
                correctAnswer = paper
              default:
                correctAnswer = computerChoice
            }
        }
        
        if userChoice == correctAnswer {
            points += 1
            feedback.title = "Nice Work!"
            
            if points == 1 {
                feedback.message = "You have \(points) point."
            } else {
                feedback.message = "You have \(points) points."
            }
        } else {
            points -= 0
            feedback.title = "Nope!"
            feedback.message = "Better luck next time!"
        }
    }
    
    func nextQuestion() {
        randomMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        questionCount += 1
    }
    
    func resetGame() {
        randomMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        roundNumber += 1
        points = 0
        questionCount = 0
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
