//
//  MapView.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/23/21.
//

import SwiftUI
import MapKit

/*
 The coordinator class receives values from MapView.
 MapView stores that value in a @Binding property, i.e. somewhere else
 This allows us to connect MKMapView to whatever SwiftUI view is using the map.
*/

struct MapView: UIViewRepresentable {
	@Binding var centerCoordinate: CLLocationCoordinate2D
	// These properties contain details about each map pin
	@Binding var selectedPlace: MKPointAnnotation?
	@Binding var showingPlaceDetails: Bool
	
	var annotations: [MKPointAnnotation] // all of the locations the user added in ContentView
	
	 func makeUIView(context: Context) -> MKMapView {
		  let mapView = MKMapView()
		  mapView.delegate = context.coordinator
		  return mapView
	 }

	 func updateUIView(_ view: MKMapView, context: Context) {
		// Check whether the annotations arrays have the same number of items
		// If they don't, remove all existing annotations and add them again 
		if annotations.count != view.annotations.count {
			view.removeAnnotations(view.annotations)
			view.addAnnotations(annotations)
		 }
	 }

	 func makeCoordinator() -> Coordinator {
		  Coordinator(self)
	 }

	 class Coordinator: NSObject, MKMapViewDelegate {
		  var parent: MapView

		  init(_ parent: MapView) {
				self.parent = parent
		  }
		
		// Update ContentView's centerCoordinate property as the map moves around
		func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
			 parent.centerCoordinate = mapView.centerCoordinate
		}
		
		func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
			 // this is our unique identifier for view reuse
			 let identifier = "Placemark"

			 // attempt to find a cell we can recycle
			 var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

			 if annotationView == nil {
				  // we didn't find one; make a new one
				  annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)

				  // allow this to show pop up information
				  annotationView?.canShowCallout = true

				  // attach an information button to the view
				  annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
			 } else {
				  // we have a view to reuse, so give it the new annotation
				  annotationView?.annotation = annotation
			 }

			 // whether it's a new view or a recycled one, send it back
			 return annotationView
		}
		
		// This method gets called when the info button is tapped 
		func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
			 guard let placemark = view.annotation as? MKPointAnnotation else { return }

			 parent.selectedPlace = placemark
			 parent.showingPlaceDetails = true
		}
	}
}

// Sample data, so the preview works
extension MKPointAnnotation {
	static var example: MKPointAnnotation {
	  let annotation = MKPointAnnotation()
	  annotation.title = "London"
	  annotation.subtitle = "Home to the 2012 Summer Olympics."
	  annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
	  return annotation
	}
}

struct MapView_Previews: PreviewProvider {
	 static var previews: some View {
		MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), selectedPlace: .constant(MKPointAnnotation.example), showingPlaceDetails: .constant(false), annotations: [MKPointAnnotation.example])
	 }
}
