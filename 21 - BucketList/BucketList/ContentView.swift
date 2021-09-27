//
//  ContentView.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

/*

*/

import SwiftUI
import MapKit
import LocalAuthentication

struct ContentView: View {
	@State private var centerCoordinate = CLLocationCoordinate2D()
	@State private var locations = [CodableMKPointAnnotation]()
	
	// Location details
	@State private var selectedPlace: MKPointAnnotation?
	@State private var showingPlaceDetails = false
	
	// Edit the pin's title and subtitle
	@State private var showingEditScreen = false
	
	// Security
	@State private var isUnlocked = false
	
    var body: some View {
		ZStack {
			if isUnlocked {
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
							let newLocation = CodableMKPointAnnotation()
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
			} else {
				// Unlock
				Button("Unlock Places") {
					 self.authenticate()
				}
				.padding()
				.background(Color.blue)
				.foregroundColor(.white)
				.clipShape(Capsule())
			}
		}
		.alert(isPresented: $showingPlaceDetails) {
			 Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
				  // edit this place
				  self.showingEditScreen = true
			 })
		}
		.sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
			 if self.selectedPlace != nil {
				  EditView(placemark: self.selectedPlace!)
			 }
		}
		.onAppear(perform: loadData)
    }
	
	// Find the app's directory
	func getDocumentsDirectory() -> URL {
		 let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		 return paths[0]
	}
	
	// Create a new URL to point to a specific file in the documents directory
	func loadData() {
		 let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")

		 do {
			  let data = try Data(contentsOf: filename)
			  locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
		 } catch {
			  print("Unable to load saved data.")
		 }
	}
	
	func saveData() {
		 do {
			  let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
			  let data = try JSONEncoder().encode(self.locations)
			  // This line encrypts the file, ensuring that it can only be read once the user has unlocked their device
			  try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
		 } catch {
			  print("Unable to save data.")
		 }
	}
	
	func authenticate() {
		 let context = LAContext()
		 var error: NSError?

		 if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			  let reason = "Please authenticate yourself to unlock your places."

			  context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

					DispatchQueue.main.async {
						 if success {
							  self.isUnlocked = true
						 } else {
							  // error
						 }
					}
			  }
		 } else {
			  // no biometrics
		 }
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
