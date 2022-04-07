//
//  MapViewExample.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/21/21.
//

import SwiftUI
import MapKit

struct MapViewExample: UIViewRepresentable {
	 func makeUIView(context: UIViewRepresentableContext<MapViewExample>) -> MKMapView {
		  let mapView = MKMapView()
		  mapView.delegate = context.coordinator
	    
		  let annotation = MKPointAnnotation()
		  annotation.title = "London"
		  annotation.subtitle = "Capital of England"
		  annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
		  mapView.addAnnotation(annotation)
		
		  return mapView
	 }

	 func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapViewExample>) {
	 }
	
	class Coordinator: NSObject, MKMapViewDelegate {
		var parent: MapViewExample
		
		init(_ parent: MapViewExample) {
			self.parent = parent
		}
		
		// This will be called every time the map view changes, e.g. when it's moved or rotated
		func makeViewDidChangeVisibleRegion(_ mapView: MKMapView) {
			print(mapView.centerCoordinate)
		}
		
		func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
			 let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
			 view.canShowCallout = true
			 return view
		}
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
}
