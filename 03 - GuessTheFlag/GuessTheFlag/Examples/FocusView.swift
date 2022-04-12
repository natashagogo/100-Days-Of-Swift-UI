//
//  FocusView.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 4/12/22.
//

import SwiftUI

struct FocusView: View {
	@State private var focusOnThis = false
	var body: some View {
		ZStack {
			Color.indigo
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
		}
	}
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView()
    }
}
