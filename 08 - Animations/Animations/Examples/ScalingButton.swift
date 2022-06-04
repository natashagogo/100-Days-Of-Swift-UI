//
//  ScalingButton.swift
//  Animations
//
//  Created by Natasha Godwin on 6/4/22.
//

import SwiftUI

struct ScalingButton: View {
	@State private var animationAmount = 1.0
	
	var body: some View {
		Button("Tap Me") {
			if animationAmount < 2.0 {
				animationAmount += 1
			} else {
				animationAmount -= 1
			}
		}
		.padding(50)
		.background(.teal)
		.foregroundColor(.white)
		.clipShape(Circle())
		.scaleEffect(animationAmount)
		.animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
	}
}

struct ScalingButton_Previews: PreviewProvider {
    static var previews: some View {
        ScalingButton()
    }
}
