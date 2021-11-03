//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/2/21.
//

import SwiftUI

/*
Can-Dos
Load static example data from the bundle
Control how NavigationView should show primary and secondary views on iPhone
Format lists of strings neatly.

Anyone who stops learning is old, whether at twenty or eighty; anyone who keeps learning stays young.
Henry Ford


*/


struct ContentView: View {
	let resorts: [Resort] = Bundle.main.decode("resorts.json")
	var body: some View {
		NavigationView {
			List(resorts, id: \.id) { resort in
				NavigationLink(destination: Text("Details on \(resort.name)")) {
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
		}
	}
		
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
