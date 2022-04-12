//
//  LightView.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 4/12/22.
//

import SwiftUI

struct LightView: View {
	@State private var selected = "First"
	@State private var reveal = false
	var body: some View {
		ZStack {
			Color.indigo
			Text(reveal ? "Show" : "Hide")
				.offset(x: reveal ? -90 : 0, y: 0)
				.frame(width: 100, height: 200)
				.foregroundStyle(.white)
				.background(reveal ? .ultraThinMaterial : .ultraThickMaterial)
				.onTapGesture {
					withAnimation(.easeIn) {
						reveal.toggle()
					}
				}
		}
		.ignoresSafeArea()
	}
	
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView()
    }
}
