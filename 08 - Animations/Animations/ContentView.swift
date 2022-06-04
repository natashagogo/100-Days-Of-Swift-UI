//
//  ContentView.swift
//  Animations
//
//  Created by Natasha Godwin on 5/26/21.
//

import SwiftUI

struct ContentView: View {
	
	 var body: some View {
		 VStack(spacing: 50) {
			 SpinningButton()
			 PulsatingButton()
			 ScalingButton()
		 }
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
