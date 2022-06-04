//
//  AnimatedBinding.swift
//  Animations
//
//  Created by Natasha Godwin on 6/4/22.
//

import SwiftUI

struct AnimatedBinding: View {
	@State private var animationAmount = 1.0

		 var body: some View {
			  VStack {
				  Button("Tap Me") {
						animationAmount += 1
				  }
				  .padding(40)
				  .background(.blue)
				  .foregroundColor(.white)
				  .clipShape(Circle())
				  .scaleEffect(animationAmount)
				  .animation(.easeInOut(duration: 1)
					.repeatCount(3, autoreverses: true), value: animationAmount)
				  
				  Spacer()
					
				  Stepper("Scale amount", value: $animationAmount.animation(
						.easeInOut(duration: 1)
							 .repeatCount(3, autoreverses: true)
				  ), in: 1...10)
			  }
			  .frame(height: 300)
		 }
}

struct AnimatedBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBinding()
    }
}
