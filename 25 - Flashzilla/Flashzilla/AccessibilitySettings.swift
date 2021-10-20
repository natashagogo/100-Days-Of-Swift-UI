//
//  AccessibilitySettings.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//

import SwiftUI

struct AccessibilitySettings: View {
	@Environment(\.accessibilityDifferentiateWithoutColor) var withoutColor
	@Environment(\.accessibilityReduceMotion) var reduceMotion
	@Environment(\.accessibilityReduceTransparency) var reduceTransparency
	@State private var scale: CGFloat = 1
    var body: some View {
		ZStack {
			Color.gray
				.edgesIgnoringSafeArea(.all)
				.opacity(reduceTransparency ? 1.0: 0.5)
			HStack {
				if withoutColor {
					Image(systemName: "checkmark.circle")
				}
				Text("Success")
			}
			.padding()
			.background(withoutColor ? Color.black : Color.green)
			.foregroundColor(Color.white)
			.clipShape(Capsule())
			.scaleEffect(scale)
			.onTapGesture {
				withOptionalAnimation {
					 self.scale *= 1.5
				}
		  }
		}
    }
	
	// Reduce motion, if enabled; otherwise, use withAnimation as usual
	func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
		 if UIAccessibility.isReduceMotionEnabled {
			  return try body()
		 } else {
			  return try withAnimation(animation, body)
		 }
	}
}

struct AccessibilitySettings_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilitySettings()
    }
}
