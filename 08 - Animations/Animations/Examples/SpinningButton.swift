//
//  SpinningButton.swift
//  Animations
//
//  Created by Natasha Godwin on 6/4/22.
//

import SwiftUI

struct SpinningButton: View {
	@State private var animationAmount = 0.0
	
	 var body: some View {
		  Button("Tap Me") {
			  withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
					animationAmount += 360
			  }
		  }
		  .padding(50)
		  .background(.teal)
		  .foregroundColor(.white)
		  .clipShape(Circle())
		  /*
			Rotating along the Y axis will move the view from left to right
			*/
		  .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
	 }
}

struct SpinningButton_Previews: PreviewProvider {
    static var previews: some View {
        SpinningButton()
    }
}
