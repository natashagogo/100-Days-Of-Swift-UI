//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/3/21.
//

import SwiftUI

struct ResortView: View {
	let resort: Resort
	@Environment(\.horizontalSizeClass) var sizeClass
	@State private var selectedFacility: Facility?
	@EnvironmentObject var favorites: Favorites
    var body: some View {
		ScrollView(.vertical) {
			VStack(alignment: .leading, spacing: 0) {
				ZStack(alignment: .bottomTrailing) {
					Image(decorative: resort.id)
						.resizable()
						.scaledToFit()
					Text("Credit: \(resort.imageCredit)")
						.font(.caption)
						.foregroundColor(Color.white)
						.padding(5)
						.background(Color.black).opacity(0.7)
				}
				Group {
					HStack {
						if sizeClass == .compact {
							Spacer()
							VStack(alignment: .leading) { ResortDetailsView(resort: resort) }
							VStack(alignment: .leading) { SkiDetailsView(resort: resort) }
							Spacer()
						} else {
							ResortDetailsView(resort: resort)
							Spacer().frame(height: 0)
							SkiDetailsView(resort: resort)
						}
					}
					.font(.headline)
					.foregroundColor(.secondary)
					.padding(.top)
					Text(resort.description)
						.padding(.vertical)
					Text("Facilities")
						.font(.headline)
					HStack {
						ForEach(resort.facilityTypes) { facility in
							facility.icon
								.font(.title)
								.onTapGesture {
									self.selectedFacility = facility
								}
						}
					}
					.padding(.vertical)
				}
				.padding(.horizontal)
			}
			Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
				 if self.favorites.contains(self.resort) {
					  self.favorites.remove(self.resort)
				 } else {
					  self.favorites.add(self.resort)
				 }
			}
			.padding()
		}
		.navigationTitle("\(resort.name), \(resort.country)")
		.navigationBarTitleDisplayMode(.inline)
		.alert(item: $selectedFacility) { facility in
			 facility.alert
		}
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
		ResortView(resort: Resort.example)
    }
}
