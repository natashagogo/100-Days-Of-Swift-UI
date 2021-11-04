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
    var body: some View {
		ScrollView(.vertical) {
			VStack(alignment: .leading, spacing: 0) {
				Image(decorative: resort.id)
					.resizable()
					.scaledToFit()
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
