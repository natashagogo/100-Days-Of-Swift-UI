//
//  User+CoreDataClass.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/7/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case about, address, age, company, email, friends, id, isActive, name, registered, tags
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

        about = try container.decode(String.self, forKey: .about)
        address = try container.decode(String.self, forKey: .address)
        age = try container.decode(Int16.self, forKey: .age)
        company = try container.decode(String.self, forKey: .company)
        email = try container.decode(String.self, forKey: .email)
        friends = try container.decode(Set<Friend>.self, forKey: .friends) as NSSet
        id = try container.decode(String.self, forKey: .id)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        name = try container.decode(String.self, forKey: .name)
        registered = try container.decode(String.self, forKey: .registered)
        tags = try container.decode(Set<Tag>.self, forKey: .tags) as NSSet
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(about, forKey: .about)
        try container.encode(address, forKey: .address)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(email, forKey: .email)
        try container.encode(friends as! Set<Friend>, forKey: .friends)
        try container.encode(id, forKey: .id)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(name, forKey: .name)
        try container.encode(registered, forKey: .registered)
        try container.encode(tags as! Set<Tag>, forKey: .tags)
    }
}
