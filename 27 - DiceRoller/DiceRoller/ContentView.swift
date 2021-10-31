//
//  ContentView.swift
//  DiceRoller
//
//  Created by Natasha Godwin on 10/31/21.
//

import SwiftUI

/*
The Project

Build an app that lets users roll dice and store the results.

Bare minimum:
✅ An app with two tabs: one for rolling, the other for seeing results

Intermediate:
- Let the user customize the dice that are rolled: how many of them, and what type: 4-sided, 6-sided, 8-sided, 10-sided, 12-sided, 20-sided, and even 100-sided.
✅  Show the total rolled on the dice.
- Store the results using Core Data so they are persistent.

Advanced:
- Add haptic feedback when dice are rolled.
- Make the value rolled by the dice flick through various possible values before settling on the final figure.

*/

struct ContentView: View {
	var game = Game()
    var body: some View {
		TabView {
			GameView()
				.tabItem {
					Image(systemName: "gamecontroller.fill")
					Text("Play")
				}
			ResultsView()
				.tabItem {
					Image(systemName: "chart.bar.fill")
					Text("Results")
				}
			
		}.environmentObject(game)
	}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
