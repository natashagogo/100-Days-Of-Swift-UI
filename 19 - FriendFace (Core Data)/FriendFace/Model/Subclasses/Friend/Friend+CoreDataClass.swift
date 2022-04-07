//
//  Friend+CoreDataClass.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/9/21.
//
//

import Foundation
import CoreData

@objc(Friend)
public class Friend: NSManagedObject, Decodable {
	
	// Properties to decode
	enum CodingKeys: CodingKey {
		 case id
		 case name
	}

	// This initializer is called when decoding from JSON
	required convenience public init(from decoder: Decoder) throws {
		 
		// Try to extract the managed object context from JSONDecoder's userInfo dictionary
		guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
			fatalError("NSManagedObjectContext is missing.")
		}
		 
		 self.init(context: context)
		 
		 let container = try decoder.container(keyedBy: CodingKeys.self)
		 
		 self.id = try container.decode(String.self, forKey: .id)

		 self.name = try container.decode(String.self, forKey: .name)
   }
}
