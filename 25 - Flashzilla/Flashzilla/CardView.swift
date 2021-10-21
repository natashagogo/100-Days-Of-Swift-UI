//
//  CardView.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/21/21.
//

import SwiftUI

struct CardView: View {
	let card: Card
	var removal: (() -> Void)? = nil
	@State private var isShowingAnswer = false
	@State private var offset = CGSize.zero
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 25.0)
				.fill(Color.white)
				.shadow(radius: 10)
			VStack(spacing: 10) {
				Text(card.prompt)
					.font(.title)
					.foregroundColor(.black)
				if isShowingAnswer {
					Text(card.answer.uppercased())
						.font(.title)
						.foregroundColor(.blue)
				}
			}
			.padding(20)
			.multilineTextAlignment(.center)
		}
		.frame(width: 450, height: 250)
		.rotationEffect(.degrees(Double(offset.width / 5)))
		.offset(x: offset.width * 5, y: 0)
		.opacity(2 - Double(abs(offset.width / 50)))
		.gesture(
			 DragGesture()
				  .onChanged { gesture in
						self.offset = gesture.translation
				  }

				  .onEnded { _ in
						if abs(self.offset.width) > 100 {
							 // remove the card
							self.removal?()
						} else {
							 self.offset = .zero
						}
				  }
		)
		.onTapGesture {
			isShowingAnswer.toggle()
		}
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(card: Card.example)
    }
}