//
//  GameHistory.swift
//  RockPaperScissors
//
//  Created by Natasha Godwin on 4/19/22.
//

import SwiftUI

class GameHistory: ObservableObject {
	@Published var list = [Game]()
}
