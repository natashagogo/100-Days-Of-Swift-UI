//
//  User+CoreDataProperties.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/9/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    @NSManaged public var tags: NSSet?
	
	
	public var wrappedAbout: String {
		about ?? "No biography written"
	}
	
	public var wrappedAddress: String {
		address ?? "Unknown"
	}
	
	public var wrappedAge: String {
		"\(age) ?? 'Unknown'"
	}
	
	public var wrappedCompany: String {
		company ?? "Unknown"
	}
	
	public var wrappedEmail: String {
		email ?? "Unknown"
	}
	
	public var wrappedId: String {
		id ?? "Unknown"
	}
	
	public var wrappedName: String {
		name ?? "Unknown"
	}
	
	public var wrappedRegistrationDate: String {
		let formatter = DateFormatter()
		formatter.timeStyle = .short
		formatter.dateStyle = .medium
		
		if let date = registered {
			return formatter.string(from: date)
		} else {
			return "Unknown"
		}
	}
	
	public var tagsArray: [Tag] {
		let set = tags as? Set<Tag> ?? []
		return set.sorted {
			$0.wrappedName < $1.wrappedName
		}
	}
	
	public var friendsArray: [Friend] {
		let set = friends as? Set<Friend> ?? []
		return set.sorted {
			$0.wrappedName < $1.wrappedName
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
