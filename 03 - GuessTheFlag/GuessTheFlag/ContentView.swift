//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 5/10/21.
//

import SwiftUI

/*
 Create an array from an enum?
 */

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
		"UK",
		"US"
	].shuffled()
	
	@State private var correctAnswer = Int.random(in: 0...2)
	@State private var showingScore = false
	@State private var scoreTitle = ""
	@State private var scoreMessage = ""
	@State private var score = 0
	
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
						 Text("Tap the flag of")
							 .font(.subheadline.weight(.heavy))
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
								 .shadow(radius: 8)
						 }
					 }
			 }
				 Spacer()
				 Spacer()
				 Text("Points: \(score)")
					 .foregroundColor(.white)
					 .font(.title.bold())
				 Spacer()
		 }
			 .padding()
	 }
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Continue", action: resetGame)
		} message: {
			Text(scoreMessage)
		}
	}
	
	func checkAnswer(number: Int) {
		if number == correctAnswer {
			scoreTitle = "Nice job!"
			scoreMessage = "You've earned one point!"
			score += 1
		} else {
			scoreTitle = "Nope!"
			scoreMessage = "Better luck next time!"
			score += 0
		}
	}
	
	func resetGame() {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
