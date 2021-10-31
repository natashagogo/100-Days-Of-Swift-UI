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
		Text("You rolled a \(game.firstDice) and \(game.secondDice) for a total of \(game.total)")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
			.environmentObject(Game())
    }
}
