//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Natasha Godwin on 4/28/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// TO DO:
// 1. Add a TextField, so the user can enter an answer
// 2. Create a function to check whether the answer is correct.
// 3. Add a score
// 4. Clean up code
        // Create two custom views for the game and settings
        // Make sure questions are presented one at a time.

struct ContentView: View {
   @State private var isActive = false
   @State private var tableSelected = 3
   @State private var levelSelected = 0
   @State private var answer = ""

    let questionOptions: [Int] = [
            5,
            10,
            15,
            20,
     ]
    
    var getQuestion: String {
        let table = 1...tableSelected
        let randomNumber = Int.random(in: table)
        let randomQuestion = "What is \(randomNumber) x \(tableSelected)?"
        
        return randomQuestion
    }
     
     var body: some View {
         NavigationView {
             Form {
                if !isActive {
                    Section(header: Text("Which tables do you wanna practice?")) {
                        Stepper(value: $tableSelected, in: 1...12) {
                          Text("\(tableSelected)")
                        }
                    }
                    Section(header: Text("How many questions?")) {
                        Picker("", selection: $levelSelected) {
                            ForEach(0 ..< questionOptions.count) {
                                Text("\(self.questionOptions[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                if isActive {
                    Section(header: Text("Questions")) {
                        List(0..<self.questionOptions[self.levelSelected], id: \.self) {_ in
                             Text("\(self.getQuestion)")
                        }
                    }
                }
            }
             .navigationBarTitle(isActive ? "Multiply This!" : "Settings")
             .navigationBarItems(trailing: Button(isActive ? "Change Settings" : "Let's Play") {
                 self.isActive.toggle()
             })
         }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
