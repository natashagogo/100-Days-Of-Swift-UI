//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 5/16/21.
//

import SwiftUI

/*
 
 UX Improvements
 
 1. When the user has the right answer, scale the prompt text up and change its color to blue.
 
 2. When the user has the wrong answer, shake the prompt text from side to side and change its color to red.
 
 */


struct ContentView: View {
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
  
    @State private var roundNumber = 1
    @State private var points = 0
	 @State private var questionCount = 0.0
	 @State private var questionTotal = 10.0
    
    @State private var giveFeedback = false
    @State private var feedback = (title: "", message: "")
	
	enum Moves: String {
		case rock = "🪨 rock"
		case paper = "📃 paper"
		case scissors = "✂️ scissors"
	}
    
	 let moves: [Moves] = [
		.rock,
		.paper,
		.scissors
    ]
    
    var body: some View {
        VStack {
			  VStack {
				  HStack(spacing: 50) {
					  Text("Round: \(roundNumber)")
					  Text("Score: \(points)")
				  }
				  .font(.title3)
				  ProgressView(value: questionCount, total: questionTotal)
			  }
			  .padding()
			 
			  VStack(spacing: 10) {
				  if shouldWin {
						  Text("Win the game")
						  .font(.subheadline)
					 } else {
						  Text("Lose the game")
							 .font(.subheadline)
					 }
				  Text(moves[randomMove].rawValue)
					 .font(.largeTitle)
					 .padding(.bottom, 20)
			  }
            
            
            ForEach(moves, id: \.self) { move in
                Button(action: {
						 self.checkAnswer(selection: move.rawValue)
						  if questionCount == 10 {
								self.giveFeedback.toggle()
							}
                    self.nextQuestion()
                }) {
						 Text(move.rawValue)
							 .frame(width: 150, height: 30)
                }
					 .buttonStyle(.bordered)
					 .tint(.blue)
            }
        }.alert(isPresented: $giveFeedback) {
			  Alert(title: Text("That's it!"), message: Text("You earned \(points) points in this round."), dismissButton: .default(Text("OK")) {
					self.resetGame()
			})
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
					correctAnswer = paper.rawValue
              case paper:
					correctAnswer = scissors.rawValue
              case scissors:
					correctAnswer = rock.rawValue
              default:
					correctAnswer = computerChoice.rawValue
            }
        } else {
            switch computerChoice {
              case rock:
					correctAnswer = scissors.rawValue
              case paper:
					correctAnswer = rock.rawValue
              case scissors:
					correctAnswer = paper.rawValue
              default:
					correctAnswer = computerChoice.rawValue
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
