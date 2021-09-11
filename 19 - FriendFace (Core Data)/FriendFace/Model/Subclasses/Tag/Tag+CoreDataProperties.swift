//
//  Tag+CoreDataProperties.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/9/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String?
    @NSManaged public var user: NSSet?
	
	public var wrappedName: String {
		name ?? "Tag not found in database"
	}

}

// MARK: Generated accessors for user
extension Tag {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension Tag : Identifiable {

}
