//
//  ContentView.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//

/*
What's a quick way to create a list of sample data?
Use this initializer for arrays: init(repeating: count:)
*/

import SwiftUI

extension View {
	// Get an item's position in the array and the length of the array
	// Offset each view by 10 points, for every position that comes before it.
	// Example: If a view is third, offset it by 20 points
	func stacked(at position: Int, in total: Int) -> some View {
		let offset = CGFloat(total - position)
		return self.offset(CGSize(width: 0, height: offset * 10))
	}
}

struct ContentView: View {
	@State private var cards = [Card](repeating: Card.example, count: 10)
    var body: some View {
		ZStack {
			Color.blue
			  .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			  .opacity(0.3)
			VStack {
				ZStack {
					ForEach(0..<cards.count, id: \.self) { index in
						CardView(card: self.cards[index]) {
							withAnimation {
								self.removeCard(at: index)
							}
						}
						.stacked(at: index, in: self.cards.count)
					}
				}
			}
		}
    }
	
	func removeCard(at index: Int) {
		cards.remove(at: index)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
