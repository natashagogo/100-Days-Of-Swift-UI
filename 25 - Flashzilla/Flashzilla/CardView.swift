//
//  CardView.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/21/21.
//

import SwiftUI

struct CardView: View {
	@Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
	let card: Card
	var removal: (() -> Void)? = nil
	@State private var isShowingAnswer = false
	@State private var offset = CGSize.zero
	@State private var feedback = UINotificationFeedbackGenerator()
	@Environment(\.accessibilityEnabled) var accessibilityEnabled
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 25, style: .continuous)
				 .fill(
					  differentiateWithoutColor
							? Color.white
							: Color.white
								 .opacity(1 - Double(abs(offset.width / 50)))

				 )
				 .background(
					  differentiateWithoutColor
							? nil
							: RoundedRectangle(cornerRadius: 25, style: .continuous)
								 .fill(offset.width > 0 ? Color.green : Color.red)
				 )
				 .shadow(radius: 10)
			VStack(spacing: 10) {
				 if accessibilityEnabled {
					  Text(isShowingAnswer ? card.answer : card.prompt)
							.font(.largeTitle)
							.foregroundColor(.black)
				 } else {
					  Text(card.prompt)
							.font(.largeTitle)
							.foregroundColor(.black)

					  if isShowingAnswer {
							Text(card.answer)
								 .font(.title)
								 .foregroundColor(.gray)
					  }
				 }
			}
			.padding(20)
			.multilineTextAlignment(.center)
		}
		.frame(width: 450, height: 250)
		.rotationEffect(.degrees(Double(offset.width / 5)))
		.offset(x: offset.width * 5, y: 0)
		.opacity(2 - Double(abs(offset.width / 50)))
		.accessibility(addTraits: .isButton) // tell VoiceOver this view is tappable
		.gesture(
			 DragGesture()
				.onChanged { offset in
					 self.offset = offset.translation
					 self.feedback.prepare()
				 }

				  .onEnded { _ in
						if abs(self.offset.width) > 100 {
							// Only give haptic feedback when the answer is wrong
							if self.offset.width < 0 {
								self.feedback.notificationOccurred(.error)
							}
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
		.animation(.spring())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(card: Card.example)
    }
}
