//
//  MKPointAnnotation-Codable.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/27/21.
//

import Foundation
import MapKit

/*

How do you make someone else's class conform to Codable?

Why can't MKPointAnnotation conform to Codable?
It isn't a final class, which means other classes can inherit from it.
Even if the class itself conforms to Codable, you can't guarantee its subclasses will.

What are some workarounds for getting MKPointAnnotation to conform to Codable?
1. Create a class that conforms to the MKAnnotation protocol.
2. Create a subclass of MKPointAnnotation and implement Codable conformance there.
3. Create a wrapper struct that conforms to Codable and store MKPointAnnotation internally.

What is behavioral subtyping, i.e. the Liskov Substitution Principle?
Objects of a superclass and subclass are interchangeable.


Things to learn about:
SOLID design principles

Questions
If Core Data and the iOS file system both allow you to store as much data as you need, what's the difference?


*/


/*

MKPointAnnotation can't directly conform to Codable because it isn't a final class.
Even if the class itself conforms to Codable, you can't guarantee its subclasses will.
For safety reasons, Swift won't allow this.

There are three ways to make MKPointAnnotation conform to Codable:
1. Create a class that conforms to the MKAnnotation protocol.
2. Create a subclass of MKPointAnnotation and implement Codable conformance there.
3. Create a wrapper struct that conforms to Codable and store MKPointAnnotation internally.

This solution takes the second option.

*/

class CodableMKPointAnnotation: MKPointAnnotation, Codable {
	 enum CodingKeys: CodingKey {
		  case title, subtitle, latitude, longitude
	 }

	 override init() {
		  super.init()
	 }

	 public required init(from decoder: Decoder) throws {
		  super.init()

		  let container = try decoder.container(keyedBy: CodingKeys.self)
		  title = try container.decode(String.self, forKey: .title)
		  subtitle = try container.decode(String.self, forKey: .subtitle)

		  let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
		  let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
		  coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	 }

	 public func encode(to encoder: Encoder) throws {
		  var container = encoder.container(keyedBy: CodingKeys.self)
		  try container.encode(title, forKey: .title)
		  try container.encode(subtitle, forKey: .subtitle)
		  try container.encode(coordinate.latitude, forKey: .latitude)
		  try container.encode(coordinate.longitude, forKey: .longitude)
	 }
}


