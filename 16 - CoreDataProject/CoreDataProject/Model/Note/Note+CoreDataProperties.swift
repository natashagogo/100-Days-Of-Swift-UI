//
//  Note+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/11/21.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var category: String?
    @NSManaged public var text: String?
    @NSManaged public var date: Date?
	
	var wrappedText: String {
		text ?? ""
	}
	
	var wrappedCategory: String {
		category ?? "Uncategorized"
	}
	
	var wrappedDate: Date {
		date ?? Date()
	}
	
	var formattedDate: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .long
		return formatter.string(from: wrappedDate)
	}

}

extension Note : Identifiable {

}
