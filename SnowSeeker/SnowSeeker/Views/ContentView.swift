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
	@ObservedObject var favorites = Favorites()
	let resorts: [Resort] = Bundle.main.decode("resorts.json")
	
	@State private var isSortingOptions = false
	@State private var isFilteringOptions = false
	@State private var sortSelected: SortType = .none
	
	enum SortType {
		case none
		case alphabetical
		case country
	}
	
	var sortedResorts: [Resort] {
		switch sortSelected {
		case .none:
			return resorts
		case .alphabetical:
			return resorts.sorted {$0.name < $1.name }
		case .country:
			return resorts.sorted {$0.country < $1.country }
		}
	}
	var body: some View {
		NavigationView {
			List(sortedResorts, id: \.id) { resort in
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
						}.layoutPriority(1)
						if self.favorites.contains(resort) {
							 Spacer()
							 Image(systemName: "heart.fill")
							 .accessibility(label: Text("This is a favorite resort"))
								  .foregroundColor(.red)
						}
					}
				}
			}
			.navigationTitle("Resorts")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {
						self.isSortingOptions = true
					}) {
						VStack {
							Image(systemName: "arrow.up.arrow.down.square.fill")
								.font(.title)
							Text("Sort")
								.font(.caption)
						}
						.foregroundColor(Color.black)
						.padding()
					}
				}
			}
			.actionSheet(isPresented: $isSortingOptions) {
				ActionSheet(title: Text("Sort By"), message: Text("Select your sorting preferences"), buttons: [
					.default(Text("None")) { self.sortSelected = .none },
					.default(Text("Name")) {self.sortSelected = .alphabetical },
					.default(Text("Country")) { self.sortSelected = .country }
				])
			}
			WelcomeView()
		}.environmentObject(favorites)
	}
		
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
