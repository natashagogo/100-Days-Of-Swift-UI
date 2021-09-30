//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 5/10/21.
//

import SwiftUI

struct FlagImage: View {
    var path: String
    var body: some View {
        Image(path)
            .renderingMode(.original)
            .clipShape(Capsule()) // round the edges
            .overlay(Capsule().stroke(Color.blue, lineWidth: 0.5)) // add a border
            .shadow(color: .blue, radius: 2)
    }
}


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
	 
	let labels = [
		 "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
		 "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
		 "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
		 "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
		 "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
		 "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
		 "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
		 "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
		 "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
		 "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
		 "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
	]
	
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var userScore = 0
    @State private var showingScore = false
    
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var animationAmounts = [0.0, 0.0, 0.0]
    @State private var animateOpacity = false
    
    @State private var showingAlert = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                HStack {
                    Text("\(userScore)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("points")
                        .foregroundColor(.white)
                }
                VStack {
                    Text("Tap the flag of:")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    FlagImage(path: countries[number])
                        .rotation3DEffect(.degrees(self.animationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                        .opacity(self.animateOpacity ? (number == self.correctAnswer ? 1 : 0.25) : 1)
                        .onTapGesture {
                            self.flagTapped(number)
                        }
								.accessibility(label: Text(self.labels[self.countries[number], default: "Unknown flag"]))
                }
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text("\(scoreTitle)"), message: Text("\(scoreMessage)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        
        withAnimation {
            self.animateOpacity = true
        }
        
        if number == correctAnswer {
            scoreTitle = "Nice work!"
            userScore += 1
            
            withAnimation {
                self.animationAmounts[number] += 360
            }
            
            if userScore == 1 {
                scoreMessage = "You've earned \(userScore) point."
            } else {
                scoreMessage = "You've earned \(userScore) points."
            }
        } else {
            scoreTitle = "Nope!"
            scoreMessage = "That's \(countries[number]) flag."
        }
        showingScore = true
    }
    
    // Reset the game
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        animateOpacity = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
