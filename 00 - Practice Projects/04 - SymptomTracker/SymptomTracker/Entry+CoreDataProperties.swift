//
//  Entry+CoreDataProperties.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/21/21.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var date: Date?
    @NSManaged public var score: String?
    @NSManaged public var symptom: Symptom?
    
    public var unwrappedDate: Date {
        date ?? Date()
    }
    
    public var unwrappedScore: String {
        score ?? "Mild"
    }
    
    public var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let date = formatter.string(from: unwrappedDate)
        return date
    }

}

extension Entry : Identifiable {

}
