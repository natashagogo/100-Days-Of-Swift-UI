//
//  ResultsView.swift
//  DiceRoller
//
//  Created by Natasha Godwin on 10/31/21.
//

import SwiftUI

struct ResultsView: View {
	@EnvironmentObject var game: Game
    var body: some View {
		NavigationView {
			if game.results.isEmpty {
				VStack{
					Text("You haven't rolled any dice yet.")
						.foregroundColor(.secondary)
						.padding()
					Spacer()
				}.navigationTitle("Results")
			} else {
				List {
					ForEach(game.results, id: \.self) { result in
						VStack(alignment: .leading) {
							Text("First Dice: \(result[0])")
							Text("Second Dice: \(result[1])")
							Text("Total: \(result[0] + result[1])")
						}
					}
				}.navigationTitle("Results")
			}
		}
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
			.environmentObject(Game())
    }
}
