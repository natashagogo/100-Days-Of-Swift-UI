//
//  ContentView.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI
import MapKit

/*

What are some good examples of when you should make an extension conform to ObservableObject?
 
Adding a pin to a map is a good use case. In MapKit, annotations are of type MKPointAnnotation; and the title and subtitle properties for this type are optionals.

This creates problem when adding editing functionality in a SwiftUI app: the title and subtitle properties are optionals, but text fields can't contain optionals.

To give the user the option of updating these properties, you can write an extension on MKPointAnnotation that unwraps each property and use property observers to get and set its values.

From there, you can add an @ObservedObject property of type MKPointAnnotation to the edit view, so its values can be updated.
 

 Is it possible for an object to conform to ObservableObject and not have @Published properties?
 
 Yes. You can use property observers instead, and depending on performance considerations, it may be better to do so.
 With an @Published property wrapper, the view refreshes every time its value changes. Properties are read as changes are made. In some cases, like when allowing users to edit annotations on a map, this isn't desirable.

How can you get a list of nearby locations?
Query Wikipedia using GPS coordinates and it will send back a list of places that are nearby. 

You can mix and match Text views with different styles using the + operator
Text("Title").italic() + Text("by") + Text("Author").bold()


*/


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
