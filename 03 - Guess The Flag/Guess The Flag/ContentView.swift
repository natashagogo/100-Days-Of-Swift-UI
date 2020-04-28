//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Natasha Godwin on 4/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// Creates a custom view for the flags
struct FlagImage: View {
    var image: String
    var body: some View {
        Image(image)
         .renderingMode(.original)
         .clipShape(Capsule())
         .overlay(Capsule().stroke(Color.gray, lineWidth: 0.5))
         .shadow(color: .black, radius: 2, x: 2, y: 3)
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
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var score = 0
    
    // Set the rotation and opacity for each button
    @State private var rotation = [0.0, 0.0, 0.0]
    @State private var opacity = [1.0, 1.0, 1.0]
    
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
                        withAnimation(.easeOut(duration: 1)) {
                            if index == self.correctAnswer {
                                self.rotation[index] += 360
                                switch index {
                                  case 0:
                                    self.opacity[1] = 0.75
                                    self.opacity[2] = 0.75
                                  case 1:
                                    self.opacity[0] = 0.75
                                    self.opacity[2] = 0.75
                                  default:
                                    self.opacity[0] = 0.75
                                    self.opacity[1] = 0.75
                                }
                            }
                        }
                        
                    }) {
                        FlagImage(image: self.countries[index])
                            .rotation3DEffect(.degrees(self.rotation[index]), axis: (x: 0, y: 1, z: 0))
                            .opacity(self.opacity[index])
                    }
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
        opacity = [1.0, 1.0, 1.0]
        rotation = [0.0, 0.0, 0.0]
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
