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

class Settings: ObservableObject {
    @Published var table = 5
}

struct ContentView: View {
    @ObservedObject var settings = Settings()
    @State private var isActive = false
    var body: some View {
        NavigationView {
            VStack {
                if isActive {
                    PlayGame(settings: self.settings)
                } else {
                    UpdateSettings(settings: self.settings)
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
    @ObservedObject var settings: Settings
    var body: some View {
        Form {
            Stepper("\(settings.table) tables", value: $settings.table, in: 1...12)
        }
    }
}

struct PlayGame: View {
    @ObservedObject var settings: Settings
    var body: some View {
        VStack {
            Text("We're going to practice the \(settings.table) tables!")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
