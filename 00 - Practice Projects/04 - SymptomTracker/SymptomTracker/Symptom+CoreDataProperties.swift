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
    
    public var entryArray: [Entry] {
        let set = entry as? Set<Entry> ?? []
        return set.sorted {
            $0.unwrappedDate < $1.unwrappedDate
        }
    }

}

extension Symptom : Identifiable {

}
