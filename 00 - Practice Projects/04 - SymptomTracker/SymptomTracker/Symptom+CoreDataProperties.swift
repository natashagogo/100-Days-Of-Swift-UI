//
//  Symptom+CoreDataProperties.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/20/21.
//
//

import Foundation
import CoreData


extension Symptom {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Symptom> {
        return NSFetchRequest<Symptom>(entityName: "Symptom")
    }

    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var entry: NSSet?
    
    public var unwrappedName: String {
        self.name?.lowercased() ?? "New Symptom"
    }
    
    public var unwrappedStartDate: Date {
        self.startDate ?? Date()
    }
    
    public var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let date = formatter.string(from: unwrappedStartDate)
        return date
    }
    
    /*
      NSSet is an Objective-C data type, so it won't work with SwiftUI.
      Additionally, it isn't limited to a specific type.
     
      To fix this, we'll do three things:
      1. Convert NSSet to Set<Entry>, a Swift type.
      2. Converts Set<Entry> into an array, so it can be used with ForEach.
      3. Sorts the entries by date.
      
     */
    
    public var entryArray: [Entry] {
        let set = entry as? Set<Entry> ?? []
        // Sorting a set automatically returns an array, but since we're using custom types, we need to specify how they should be sorted in a closure.
        return set.sorted {
            $0.unwrappedDate < $1.unwrappedDate
        }
    }

}

extension Symptom : Identifiable {

}
