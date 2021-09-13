//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/13/21.
//

import SwiftUI

struct ContentView: View {
	 var body: some View {
		VStack {
			BlurredText()
			ActionSheetExample()
		}
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
