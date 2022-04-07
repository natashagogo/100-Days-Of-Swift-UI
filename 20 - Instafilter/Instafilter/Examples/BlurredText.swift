//
//  BlurredText.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/13/21.
//

import SwiftUI

struct BlurredText: View {
	@State private var blurAmount: CGFloat = 0
	@State private var message = "Hello, World!"

	 var body: some View {
			let blur = Binding<CGFloat>(
				get: {
					self.blurAmount
				},
				set: {
					self.blurAmount = $0
					if self.blurAmount > 0.5 {
						message = "Goodbye, World!"
					} else {
						message = "Hello, World!"
					}
			  }
			)
		  return VStack {
				Text(message)
					 .blur(radius: blurAmount)

				Slider(value: blur, in: 0...20)
		  }
	 }
}

struct BlurredText_Previews: PreviewProvider {
    static var previews: some View {
        BlurredText()
    }
}
