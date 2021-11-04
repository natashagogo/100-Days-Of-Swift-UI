//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/2/21.
//

import SwiftUI

/*
 Can-Dos
 Change a view's layout in response to size classes
 
 */


struct ContentView: View {
	let resorts: [Resort] = Bundle.main.decode("resorts.json")
	var body: some View {
		NavigationView {
			List(resorts, id: \.id) { resort in
				NavigationLink(destination: ResortView(resort: resort)) {
					HStack {
						Image(decorative: resort.country)
							.resizable()
							.scaledToFill()
							.frame(width: 30, height: 30)
							.clipShape(Circle())
							.overlay(Circle().stroke(Color.black, lineWidth: 1))
						VStack(alignment: .leading) {
							Text(resort.name)
								.font(.headline)
							Text("\(resort.runs) runs")
								.foregroundColor(.secondary)
						}
					}
				}
			}.navigationTitle("Resorts")
			WelcomeView()
		}
	}
		
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
