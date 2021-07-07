//
//  Tag+CoreDataProperties.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/7/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var tag: String?
    @NSManaged public var user: User?
    
    public var unwrappedTag: String {
        tag ?? "Failed to load tag"
    }

}

extension Tag : Identifiable {

}
