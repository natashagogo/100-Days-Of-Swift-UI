//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var userMove = ""
    @State private var points = 0
    
    let moves = [
        "Rock",
        "Paper",
        "Scissors"
    ]
    
    
    var body: some View {
        VStack {
            Text("Score: \(points)")
            Text("\(moves[randomMove])")
            
            if shouldWin {
                Text("Win the game.")
            } else {
                Text("Lose the game.")
            }
            
            ForEach(moves, id: \.self) {
                Button($0) {
                    // code goes here
                }
            }
            
        }
    }
    
    func checkAnswer() {
        // to be completed
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
