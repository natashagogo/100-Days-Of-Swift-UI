//
//  ContentView.swift
//  MultiplyThis
//
//  Created by Natasha Godwin on 5/30/21.
//

import SwiftUI

/*
 
 This app needs ...
 
 - Two views (one for settings, the other for the game)
 - A way to select multiplication tables to practice (buttons, stepper)
 - A way to choose the number of questions (5, 10, 20, or “All”)
 - A randomly generated set of questions, within the parameters set by the user

 */



class Game: ObservableObject {
    @Published var level = 5
}

struct ContentView: View {
    @ObservedObject var game = Game()
    @State private var isActive = false
    var body: some View {
        NavigationView {
            VStack {
                if isActive {
                    PlayGame(game: self.game)
                } else {
                    UpdateSettings(game: self.game)
                }
            }
            .navigationBarTitle(isActive ? "Game": "Settings")
            .navigationBarItems(trailing: Button(isActive ? "Settings": "Play") {
                self.isActive.toggle()
            })
        }
    }
    
}

struct UpdateSettings: View {
    @ObservedObject var game: Game
    var body: some View {
        Form {
            Section(header: Text("Practice")) {
                Stepper("\(game.level) tables", value: $game.level, in: 1...12)
            }
        }
    }
}

struct PlayGame: View {
    @ObservedObject var game: Game
    var body: some View {
        VStack {
            Text("We're going to practice the \(game.level) tables!")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
