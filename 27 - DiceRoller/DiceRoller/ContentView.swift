//
//  ContentView.swift
//  DiceRoller
//
//  Created by Natasha Godwin on 10/31/21.
//

import SwiftUI

/*
Can-Dos

Read environment values using @EnvironmentObject
Create tabs with TabView
Use Swift’s Result type to send back success or failure
Manually publish ObservableObject changes using objectWillChange.send()
Control image interpolation
Place buttons in a ContextMenu
Create local notifications with the UserNotifications framework
Use third-party code with Swift package dependencies
Use map() and filter() to create new arrays based on an existing one
Create dynamic QR codes
Attach custom gestures to a SwiftUI view.
Use UINotificationFeedbackGenerator to make iPhones vibrate
Disable user interactivity using allowsHitTesting()
Trigger events repeatedly using Timer, or by receiving events from NotificationCenter
Support color blindness, reduced motion, and more.
Use NavigationView in landscape with StackNavigationViewStyle.
Explain SwiftUI’s three step layout system.
Create alignment, alignment guides, and custom alignment guides.
Absolutely position views using the position() modifier.
Use GeometryReader and GeometryProxy to make special effects.


Functional programming versus Imperative Programming
Functional programming means telling the computer what to do. Imperative means tells it how to do it.

Higher-order functions
Functions that accept another function as a parameter (or send back a function as their return value)

Examples: .map() and .filter()

.compactMap()
Runs a transformation function over an array, unwraps optionals, and returns a new one with the results, discarding any nil values along the way


Questions
Are declarative and functional programming the same? What about imperative and procedural?

The Project

Build an app that lets users roll dice and store the results.

Bare minimum:
An app with two tabs: one for rolling, the other for seeing results

Intermediate:
- Let the user customize the dice that are rolled: how many of them, and what type: 4-sided, 6-sided, 8-sided, 10-sided, 12-sided, 20-sided, and even 100-sided.
- Show the total rolled on the dice.
- Store the results using Core Data so they are persistent.

Advanced:
- Add haptic feedback when dice are rolled.
- Make the value rolled by the dice flick through various possible values before settling on the final figure.



*/

struct Dice {
	var firstDice: Int = 0
	var secondDice: Int = 0
}

struct Game: View {
	@State private var game = Dice()
	 var body: some View {
		VStack(spacing: 50) {
			Text("You rolled \(game.firstDice + game.secondDice)")
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
				rollDice()
			}
		}
	 }
	
	func rollDice() {
		game.firstDice = Int.random(in: 1...6)
		game.secondDice = Int.random(in: 1...6)
	}
}

struct ContentView: View {
    var body: some View {
		Game()
	}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
