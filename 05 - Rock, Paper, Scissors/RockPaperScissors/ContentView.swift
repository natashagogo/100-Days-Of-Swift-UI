//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 4/14/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var computerMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var roundNumber = 1
    @State private var questionNumber = 0
    
    @State private var giveFeedback = false
    @State private var feedback = (title: "", content: "")
    
    let moves = [
        "rock",
        "paper",
        "scissors"
    ]
    
    var getInstructions: String {
        let win = "Win the game."
        let lose = "Lose the game."

        if shouldWin == true {
            return win
        } else {
            return lose
        }
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                HStack {
                    Group {
                        Text("Points:")
                           .font(.callout)
                        Text("\(score)")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Group {
                        Text("Round:")
                           .font(.callout)
                        Text("\(roundNumber)")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                .frame(width: 250, height: 50)
                
                Group {
                    Text("The computer chose:")
                      .font(.callout)
                    Text("\(moves[computerMove].uppercased())")
                      .font(.largeTitle)
                      .foregroundColor(.blue)
                    Text("\(getInstructions)")
                }
                
                ForEach(0..<moves.count) { move in
                    Button(action: {
                        self.checkAnswer(selection: move)
                        self.giveFeedback = true
                        self.questionNumber += 1
                        self.nextQuestion()
                    }) {
                        Text("\(self.moves[move].uppercased())")
                    }
                    .frame(width: 160, height: 40)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .padding(5)
                }
            }
        }.alert(isPresented: $giveFeedback) {
            if questionNumber == 10 {
                return Alert(title: Text("That's the end of round \(roundNumber)."), message: Text("You earned \(score) points in this round."), dismissButton: .default(Text("Play Again")) {
                    self.resetGame()
                })
            } else {
                return Alert(title: Text("\(feedback.title)"), message: Text("\(feedback.content)"), dismissButton: .default(Text("Keep Going")) {
                    self.nextQuestion()
              })
            }
        }
    }
    
    func checkAnswer(selection: Int) {
        let computerChoice = moves[computerMove]
        let userChoice = moves[selection]
        var correctAnswer: String = ""
        
        let rock = "rock"
        let paper = "paper"
        let scissors = "scissors"
        
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
            score += 1
            feedback.title = "Nice work!"
            
            switch score {
              case 0:
                feedback.content = "No points for you!"
              case 1:
                feedback.content = "You earned \(score) point."
              default:
                feedback.content = "You earned \(score) points."
            }
            
        } else if userChoice == computerChoice {
            score += 0
            feedback.title = "Don't copycat!"
            feedback.content = "Pick a different answer."
        } else {
            score -= 1
            feedback.title = "Nope!"
            feedback.content = "You lost a point. Better luck next time!"
        }
        
        if score < 0 {
            score = 0
        }
    }
    
    func nextQuestion() {
        computerMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func resetGame() {
        computerMove = Int.random(in: 0...2)
        shouldWin = Bool.random()

        score = 0
        questionNumber = 0
        roundNumber += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
