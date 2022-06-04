//
//  PulsatingButton.swift
//  Animations
//
//  Created by Natasha Godwin on 6/4/22.
//

import SwiftUI

struct PulsatingButton: View {
	@State private var animationAmount = 1.0
	
	 var body: some View {
		 Button("Tap Me") {
		
		 }
		 .padding(50)
		 .background(.teal)
		 .foregroundColor(.white)
		 .clipShape(Circle())
		 .overlay(
			  Circle()
					.stroke(.teal)
					.scaleEffect(animationAmount)
					.opacity(2 - animationAmount)
					.animation(
							.easeOut(duration: 1)
							.repeatForever(autoreverses: false),
							value: animationAmount
					  )
					.onAppear {
						 animationAmount = 2
					}
		 )
	 }
}

struct PulsatingButton_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingButton()
    }
}
