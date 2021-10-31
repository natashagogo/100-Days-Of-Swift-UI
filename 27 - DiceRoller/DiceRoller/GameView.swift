//
//  GameView.swift
//  DiceRoller
//
//  Created by Natasha Godwin on 10/31/21.
//

import SwiftUI

struct GameView: View {
	@EnvironmentObject var game: Game
	 var body: some View {
		VStack(spacing: 50) {
			Text("You rolled a \(game.total)")
			HStack(spacing: 20) {
				Text("\(game.firstDice)")
					.frame(width: 50, height: 50)
					.border(Color.black, width: 2)
					.background(Color.white)
					.clipShape(RoundedRectangle(cornerRadius: 5))
				Text("\(game.secondDice)")
					.frame(width: 50, height: 50)
					.border(Color.black, width: 2)
					.background(Color.white)
					.clipShape(RoundedRectangle(cornerRadius: 5))
			}.font(.largeTitle)
			Button("Roll") {
				game.rollDice()
			}
		}
	 }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
		GameView()
			.environmentObject(Game())
    }
}
