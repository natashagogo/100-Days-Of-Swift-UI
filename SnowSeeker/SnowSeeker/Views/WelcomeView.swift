//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/3/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
		VStack {
			Text("Welcome to SnowSeeker!")
				.font(.largeTitle)
			Text("Swipe left to select a resort.")
				.foregroundColor(.secondary)
		}
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
