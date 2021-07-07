//
//  Tag+CoreDataClass.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/7/21.
//
//

import Foundation
import CoreData

@objc(Tag)
public class Tag: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case id, users
    }

    enum DecoderConfigurationError: Error {
        case missingManagedObjectContext
    }

    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        users = try container.decode(Set<User>.self, forKey: .users) as NSSet
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(users as! Set<User>, forKey: .users)
    }
}
