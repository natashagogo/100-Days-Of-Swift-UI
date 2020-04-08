//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Natasha Godwin on 4/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
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
        "UK",
        "US"
    ].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 30) {
                HStack {
                    Spacer()
                    Text("Points: ")
                        .foregroundColor(.white)
                        .font(.callout)
                    Text("\(score)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                }.padding(.trailing, 50)
                VStack {
                    Text("Tap the flag of...")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(countries[correctAnswer].uppercased())
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { index in
                    Button(action: {
                        self.flagTapped(index)
                    }) {
                        Image(self.countries[index])
                            .renderingMode(.original) // tells SwiftUI to render the original image (instead of recoloring them as a button)
                    }
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.gray, lineWidth: 0.5))
                    .shadow(color: .black, radius: 2, x: 2, y: 3)
                    
                }
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ index: Int) {
        if index == correctAnswer {
            alertTitle = "Nice work! Keep it up!"
            alertMessage = "You earned a point."
            score += 1
        } else {
            alertTitle = "Nope! That's \(countries[index])'s flag."
            alertMessage = "You lost a point."
            score -= 1
        }
        
        if score < 0 {
            score = 0
        }
        
        showingScore = true
    }
    
    // Reset the game
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
