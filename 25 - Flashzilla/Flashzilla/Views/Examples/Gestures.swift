//
//  Gestures.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/19/21.
//

import SwiftUI

struct MagnifyView: View {
	@State private var currentAmount: CGFloat = 0
	@State private var finalAmount: CGFloat = 1
	var body: some View {
		Text("Hello, World!")
			.scaleEffect(finalAmount + currentAmount)
			.gesture(
			 MagnificationGesture()
				  .onChanged { amount in
						self.currentAmount = amount - 1
				  }
				  .onEnded { amount in
						self.finalAmount += self.currentAmount
						self.currentAmount = 0
			}
		)
	}
}


struct RotateView: View {
	@State private var currentAmount: Angle = .degrees(0)
	@State private var finalAmount: Angle = .degrees(0)
	var body: some View {
		Text("Rotate Me!")
			.rotationEffect(finalAmount + currentAmount)
			.gesture(
			 RotationGesture()
				  .onChanged { angle in
						self.currentAmount = angle
				  }
				  .onEnded { angle in
					  self.finalAmount += self.currentAmount
					  self.currentAmount = .degrees(0)
			}
		)
	}
}

struct Vinyl: View {
	var body: some View {
		ZStack {
			Circle()
				.frame(width: 150, height: 150)
				.foregroundColor(.black)
			Circle()
				.frame(width: 125, height: 125)
				.foregroundColor(.white)
			Circle()
				.frame(width: 124, height: 124)
				.foregroundColor(.black)
			Circle()
				.frame(width: 100, height: 100)
				.foregroundColor(.white)
			Circle()
				.frame(width: 99, height: 99)
				.foregroundColor(.black)
			Circle()
				.frame(width: 75, height: 75)
				.foregroundColor(.white)
			Circle()
				.frame(width: 74, height: 74)
				.foregroundColor(.black)
			Circle()
				.frame(width: 50, height: 50)
				.foregroundColor(.red)
		}
			
	}
}

struct MultiGesture: View {
	 var body: some View {
		  VStack {
				Text("Hello, World!")
					 .onTapGesture {
						  print("Text tapped")
					 }
		  }
		.highPriorityGesture(
			TapGesture()
				.onEnded { _ in
					print("VStack tapped")
				}
		)
	 }
}

struct Gestures: View {
	 var body: some View {
		NavigationView {
			List {
				NavigationLink(destination: MagnifyView()) {
					Text("Magnify")
				}
				NavigationLink(destination: RotateView()) {
					Text("Rotate")
				}
				NavigationLink(destination: MultiGesture()) {
					Text("MultiGesture")
				}
			}
			.navigationTitle("Gestures")
		}
	 }
}

struct Gestures_Previews: PreviewProvider {
    static var previews: some View {
        Gestures()
    }
}
