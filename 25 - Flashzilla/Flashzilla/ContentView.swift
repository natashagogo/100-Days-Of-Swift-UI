//
//  ContentView.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//


import SwiftUI

/*

The more comfortable you are with creating bugs, finding bugs, and fixing bugs, the better a developer you’ll be. - Paul Hudson

When testing an idea, make sure you're on the right scale:

"Years ago PepsiCo challenged mall shoppers to the “Pepsi Challenge”: drink a sip of one cola drink and a sip of another, and see which you prefer. The results found that more Americans preferred Pepsi than Coca Cola, despite Coke having a much bigger market share. However, there was a problem: people seemed to pick Pepsi in the test because Pepsi had a sweeter taste, and while that worked well in sip-size amounts it worked less well in the sizes of cans and bottles, where people actually preferred Coke."




*/

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
	@Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
	@State private var cards = [Card](repeating: Card.example, count: 10)
	@State private var timeRemaining = 100
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	@State private var isActive = true
	
    var body: some View {
		ZStack {
			Color.blue
			  .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			  .opacity(0.3)
			VStack {
				Text("Time: \(timeRemaining) seconds")
					.font(.largeTitle)
					 .foregroundColor(.white)
					 .padding(.horizontal, 20)
					 .padding(.vertical, 5)
					 .background(
						  Capsule()
								.fill(Color.black)
								.opacity(0.75)
					 )
				ZStack {
					ForEach(0..<cards.count, id: \.self) { index in
						CardView(card: self.cards[index]) {
							withAnimation {
								self.removeCard(at: index)
							}
						}
						.stacked(at: index, in: self.cards.count)
						.allowsHitTesting(index == self.cards.count - 1) // only let users drag the first card 
					}
				}
				.allowsHitTesting(timeRemaining > 0) // users can swipe cards, if there's time remaining
				if cards.isEmpty || timeRemaining == 0 {
					 Button("Start Again", action: resetCards)
						  .padding()
						  .background(Color.white)
						  .foregroundColor(.black)
						  .clipShape(Capsule())
				}
			}
			if differentiateWithoutColor {
				 VStack {
					  Spacer()

					  HStack {
							Image(systemName: "xmark.circle")
								 .padding()
								 .background(Color.black.opacity(0.7))
								 .clipShape(Circle())
							Spacer()
							Image(systemName: "checkmark.circle")
								 .padding()
								 .background(Color.black.opacity(0.7))
								 .clipShape(Circle())
					  }
					  .foregroundColor(.white)
					  .font(.largeTitle)
					  .padding()
				 }
			}
		}
		.onReceive(timer) { time in
			guard self.isActive else { return }
			if self.timeRemaining > 0 {
				self.timeRemaining -= 1
			}
		}
		.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
			 self.isActive = false
		}
		.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
			if self.cards.isEmpty == false {
				self.isActive = true
			}
		}
    }
	
	func removeCard(at index: Int) {
		cards.remove(at: index)
		if cards.isEmpty {
			isActive = false
		}
	}
	
	func resetCards() {
		cards = [Card](repeating: Card.example, count: 10)
		timeRemaining = 100
		isActive = true
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
