//
//  Friend+CoreDataProperties.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/7/21.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    
    var unwrappedId: String {
        id ?? "\(UUID())"
    }
    
    var unwrappedName: String {
        name ?? "Unknown"
    }

}

// MARK: Generated accessors for friend
extension Friend {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: User)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: User)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension Friend : Identifiable {

}
