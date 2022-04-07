//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/10/21.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?
	
	public var wrappedFullName: String {
		fullName ?? "Unknown Country"
	}
	
	public var wrappedShortName: String {
		shortName ?? "Unknown Country"
	}
	
	/*
	NSSet is an Objective-C data type that equivalent to Set in SwiftUI.
	However, it doesn't work in SwiftUI. ForEach can only read arrays.
	An additional problem is that NSSet can contain anything.
	In this case, we want to limit the candy property to Candy instances.
	*/
	
	public var candyArray: [Candy] {
		// 1. Convert the NSSet to Set.
		let set = candy as? Set<Candy> ?? []
		// 2. Convert the Set to an Array, so it can be used with ForEach.
		// Note that calling .sorted() on a set does this automatically
		return set.sorted {
			$0.wrappedName < $1.wrappedName
		}
	}

}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
