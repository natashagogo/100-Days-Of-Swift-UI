//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 5/10/21.
//

import SwiftUI

struct ContentView: View {
	@State private var countries = [
		"Estonia",
		"France",
		"Germany",
		"Ireland",
		"Italy",
		"Nigeria",
		"Poland",
		"Russia",
		"Spain",
		"The United Kingdom",
		"The United States"
	].shuffled()
	
	@State private var correctAnswer = Int.random(in: 0...2)
	@State private var showingScore = false
	@State private var scoreTitle = ""
	@State private var scoreMessage = ""
	@State private var score = 0
	
	@State private var round = 1
	@State private var question = 1
	@State private var numberOfQuestions = 5
	@State private var endOfRound = false
	
    var body: some View {
		 ZStack {
			 RadialGradient(
				stops: [
				.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
				  .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
			 ],
				center: .top,
				startRadius: 200,
				endRadius: 400)
				  .ignoresSafeArea()
			 VStack {
				 Spacer()
				 Text("Guess the Flag")
					 .font(.largeTitle.bold())
					 .foregroundColor(.white)
					 .padding(.vertical)
				 VStack(spacing: 15) {
					 VStack {
						 Text("Tap the flag of:")
							 .font(.subheadline)
						 Text(countries[correctAnswer])
							 .font(.largeTitle.weight(.semibold))
					 }
					 .foregroundColor(.white)
					 ForEach(0..<3) { number in
						 Button {
							 showingScore.toggle()
							 checkAnswer(number: number)
						 } label: {
							 Image(countries[number])
								 .renderingMode(.original)
								 .clipShape(Capsule())
								 .shadow(radius: 5)
						 }
					 }
			 }
				 Spacer()
				 Spacer()
				 VStack {
					 Text("Points: \(score)")
						 .font(.title.bold())
					 Text("Round: \(round)")
						 .font(.title2.bold())
					 Text("Question \(question) out of 5")
				 }
				 .foregroundColor(.white)
		
				 Spacer()
		 }
			 .padding()
	 }
		 .alert(scoreTitle, isPresented: $showingScore) {
			 Button("Continue", action: nextQuestion)
			 Button("Quit", role: .cancel, action: resetGame)
		 }message: {
			Text(scoreMessage)
		}
	}
	
	func checkAnswer(number: Int) {
		if number == correctAnswer && question < 5 {
			scoreTitle = "Nice job!"
			scoreMessage = "You've earned one point!"
			score += 1
			question += 1
		} else if number != correctAnswer && question < 5  {
			scoreTitle = "Nope!"
			scoreMessage = "That was \(countries[number])'s flag."
			score += 0
			question += 1
		}
		
		if question >= 5 {
			scoreTitle = "That's the end of the round!"
			scoreMessage = "You earned \(score) points."
			round += 1
			resetGame()
		}
	}
	
	func nextQuestion() {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
	}
	
	
	func resetGame() {
		score = 0
		question = 1
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
