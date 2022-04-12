//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 5/10/21.
//

import SwiftUI

struct FocusView: View {
	@State private var focusOnThis = false
	var body: some View {
		ZStack {
			Color.teal
				.ignoresSafeArea()
				.background(.ultraThinMaterial)
			Color.white
				.clipShape(focusOnThis ? RoundedRectangle(cornerRadius: 50.0) : RoundedRectangle(cornerRadius: 5.0))
				.frame(width: 100, height: 100)
				.padding()
				.background(focusOnThis ? Color.secondary : Color.clear)
				.onTapGesture {
					withAnimation(.easeInOut) {
						focusOnThis.toggle()
					}
				}
			Text("Tap")
				.foregroundColor(.teal)
		}
	}
}

struct LightView: View {
	@State private var selected = "First"
	@State private var reveal = false
	var body: some View {
		ZStack {
			Color.indigo
			Text(reveal ? "Show" : "Hide")
				.frame(width: 100, height: 200)
				.foregroundStyle(.white)
				.background(reveal ? .ultraThinMaterial : .ultraThickMaterial)
				.onTapGesture {
					reveal.toggle()
				}
				.tag("First")
		}
		.ignoresSafeArea()
	}
	
}

struct ContentView: View {
    var body: some View {
		 VStack {
			 FocusView()
			 LightView()
		 }
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
