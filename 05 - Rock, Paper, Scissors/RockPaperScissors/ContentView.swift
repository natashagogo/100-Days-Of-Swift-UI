//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 4/14/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// DONE:
// 1. Improved UX by adding a progress bar.
// 2. Improve UI design by adding emojis to choices.
// 3. Created custom views and modifiers.

// TO DO - LATER
// 1. Make the game harder by creating an "emoji round" or "mixed emoji/text round".

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.blue)
                
                Rectangle().frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.blue)
                    .animation(.linear)
                
            }
            .cornerRadius(45.0)
        }
    }
}

struct ContentView: View {
    @State private var computerMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var roundNumber = 1
    @State private var progressValue: Float = 0.0
    
    @State private var giveFeedback = false
    @State private var feedback = (title: "", content: "")
    
    let moves = [
        "👊 rock",
        "✋ paper",
        "✌️ scissors"
    ]
    
    let numberOfQuestions: Float = 10
    
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
                VStack {
                    ProgressBar(value: $progressValue)
                        .frame(height: 20)
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
                }
                .frame(width: 280, height: 50)
                .padding()
                
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
                        self.updateProgress()
                        self.nextQuestion()
                    }) {
                        Text("\(self.moves[move].uppercased())")
                    }
                    .frame(width: 220, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .padding(5)
                }
            }
        }.alert(isPresented: $giveFeedback) {
            // The progress bar goes from 0.0 to 1.0000001
            // This is because floats are evil:
                // 0.1
                // 0.2
                // 0.3
                // 0.4
                // 0.5
                // 0.6
                // 0.70000005
                // 0.8000001
                // 0.9000001
                // 1.0000001
            if progressValue == 1.0000001 {
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
        
        let rock = moves[0]
        let paper = moves[1]
        let scissors = moves[2]
        
        if shouldWin == true {
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
    
    func updateProgress() {
        let progressPerQuestion = numberOfQuestions / 100
        self.progressValue += progressPerQuestion
    }
    
    func nextQuestion() {
        computerMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func resetGame() {
        computerMove = Int.random(in: 0...2)
        shouldWin = Bool.random()

        score = 0
        progressValue = 0.0
        roundNumber += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
