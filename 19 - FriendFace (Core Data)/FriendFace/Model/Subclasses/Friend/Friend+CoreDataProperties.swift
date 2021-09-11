//
//  Friend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/9/21.
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
    @NSManaged public var user: NSSet?
	
	public var wrappedId: String {
		id ?? "No ID assigned"
	}
	
	public var wrappedName: String {
		name ?? "Friend not found in database"
	}

}

// MARK: Generated accessors for user
extension Friend {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension Friend : Identifiable {

}
