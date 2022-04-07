//
//  MKPointAnnotation.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/26/21.
//

import MapKit

/*

MKPointAnnotation's title and subtitle properties are optionals.
But in SwiftUI, text fields can't contain optional values.

To give the user the option of updating these properties,
write an extension on MKPointAnnotation that unwraps each property and changes its values.

*/

extension MKPointAnnotation: ObservableObject {
	// The properties don't need to be read as they're being changed.
	// For performance reasons, we don't want to refresh the view every time a change is made.
	// So, @Published isn't used here.
	 public var wrappedTitle: String {
		  get {
				self.title ?? "Unknown value"
		  }

		  set {
				title = newValue
		  }
	 }

	 public var wrappedSubtitle: String {
		  get {
				self.subtitle ?? "Unknown value"
		  }

		  set {
				subtitle = newValue
		  }
	 }
}
