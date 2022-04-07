//
//  EditView.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/26/21.
//

import SwiftUI
import MapKit

struct EditView: View {
	 @Environment(\.presentationMode) var presentationMode
	 @ObservedObject var placemark: MKPointAnnotation
	
	enum LoadingState {
		case loading, loaded, failed
	}
	
	@State private var loadingState = LoadingState.loading // before results have loaded
	@State private var pages = [Page]() // actual Wikipedia results

	 var body: some View {
		  NavigationView {
				Form {
					 Section {
						  TextField("Place name", text: $placemark.wrappedTitle)
						  TextField("Description", text: $placemark.wrappedSubtitle)
					 }
					Section(header: Text("Nearby…")) {
						 if loadingState == .loaded {
							  List(pages, id: \.pageid) { page in
									Text(page.title)
										 .font(.headline)
									+ Text(": ") +
									 Text(page.description)
							  }
						 } else if loadingState == .loading {
							  Text("Loading…")
						 } else {
							  Text("Please try again later.")
						 }
					}
				}
				.navigationBarTitle("Edit place")
				.navigationBarItems(trailing: Button("Done") {
					 self.presentationMode.wrappedValue.dismiss()
				})
				.onAppear(perform: fetchNearbyPlaces)
		  }
	 }
	
	func fetchNearbyPlaces() {
		 let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(placemark.coordinate.latitude)%7C\(placemark.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

		 guard let url = URL(string: urlString) else {
			  print("Bad URL: \(urlString)")
			  return
		 }

		 URLSession.shared.dataTask(with: url) { data, response, error in
			  if let data = data {
					// we got some data back
					let decoder = JSONDecoder()

					if let items = try? decoder.decode(Result.self, from: data) {
						 // if successful, convert the array values to our pages array
						self.pages = Array(items.query.pages.values).sorted()
						 self.loadingState = .loaded
						 return
					}
			  }

			  // if unsuccessful, change the loading state to failed
			  self.loadingState = .failed
		 }.resume()
	}
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
		EditView(placemark: MKPointAnnotation.example)
    }
}
