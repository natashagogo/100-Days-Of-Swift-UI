//
//  User+CoreDataProperties.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/7/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: NSSet?
    @NSManaged public var tags: NSSet?
    
    var unwrappedId: String {
        id ?? "\(UUID())"
    }
    
    var unwrappedName: String {
        name ?? "Anonymous"
    }
    
    var unwrappedCompany: String {
        company ?? "Unknown Company"
    }
    
    var unwrappedEmail: String {
        email ?? "Email not provided"
    }
    
    var unwrappedAddress: String {
        address ?? "Unknown"
    }
    
    var unwrappedBio: String {
        about ?? "Unknown"
    }
    
    var unwrappedRegistrationDate: String {
        registered ?? "Unknown"
    }
    
    var unwrappedFriends: [Friend] {
        let set = friends as? Set<Friend> ?? []
        return set.sorted {
            $0.unwrappedName < $1.unwrappedName
        }
    }
    
    var unwrappedTags: [Tag] {
        let set = tags as? Set<Tag> ?? []
        return set.sorted {
            $0 < $1
        }
    }

}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension User {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension User : Identifiable {

}
