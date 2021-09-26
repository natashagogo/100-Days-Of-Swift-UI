//
//  ContentView.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
	@State private var centerCoordinate = CLLocationCoordinate2D()
	@State private var locations = [MKPointAnnotation()]
	
	// Location details
	@State private var selectedPlace: MKPointAnnotation?
	@State private var showingPlaceDetails = false
	
	// Edit the pin's title and subtitle
	@State private var showingEditScreen = false
	
    var body: some View {
		ZStack {
			MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
				  .edgesIgnoringSafeArea(.all)
			 Circle()
				  .fill(Color.blue)
				  .opacity(0.3)
				  .frame(width: 32, height: 32)
			VStack {
				 Spacer()
				 HStack {
					  Spacer()
					  Button(action: {
						// create a new location
						let newLocation = MKPointAnnotation()
						newLocation.coordinate = self.centerCoordinate
						newLocation.title = "Example location"
						self.locations.append(newLocation)
						self.selectedPlace = newLocation
						self.showingEditScreen = true
					  }) {
							Image(systemName: "plus")
					  }
					  .padding()
					  .background(Color.orange.opacity(0.90))
					  .foregroundColor(.white)
					  .font(.title)
					  .clipShape(Circle())
					  .padding()
				 }
			}
		}
		.alert(isPresented: $showingPlaceDetails) {
			 Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
				  // edit this place
				  self.showingEditScreen = true
			 })
		}
		.sheet(isPresented: $showingEditScreen) {
			 if self.selectedPlace != nil {
				  EditView(placemark: self.selectedPlace!)
			 }
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
