//
//  User+CoreDataClass.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/9/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Decodable {
	
	enum CodingKeys: CodingKey {
		case id
		case isActive
		case name
		case age
		case company
		case email
		case address
		case about
		case registered
//		case tags
//		case friends
	}
	
	required convenience public init(from decoder: Decoder) throws {
		// Get the managed object context from JSONDecoder's userInfo dictionary
		guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
			print("Managed object context not found.")
			return
		}
		// Use it for this entity's context
		self.init(context: context)
		
		// Create a container
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		// Decode the properties
		self.id = try container.decode(String.self, forKey: .id)
		self.isActive = try container.decode(Bool.self, forKey: .isActive)
		self.name = try container.decode(String.self, forKey: .name)
		self.age = try container.decode(Int16.self, forKey: .age)
		self.company = try container.decode(String.self, forKey: .company)
		self.email = try container.decode(String.self, forKey: .email)
		self.address = try container.decode(String.self, forKey: .address)
		let untrimmedAbout = try container.decode(String.self, forKey: .about)
		self.about = untrimmedAbout.trimmingCharacters(in: CharacterSet(charactersIn: "\r\n"))
		
		// Decode the date
		let dateAsString = try container.decode(String.self, forKey: .registered)
		let dateFormatter = ISO8601DateFormatter()
		self.registered = dateFormatter.date(from: dateAsString) ?? Date()
		
		// TO DO:
		// Figure out how to decode tags and friends and attach it to this entity
		
	}
}
