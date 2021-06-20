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
    
    var unwrappedName: String {
        self.name?.lowercased() ?? "New Symptom"
    }
    
    var unwrappedStartDate: Date {
        self.startDate ?? Date()
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let date = formatter.string(from: unwrappedStartDate)
        return date
    }

}

extension Symptom : Identifiable {

}
