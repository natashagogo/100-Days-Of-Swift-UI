//
//  Album+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/27/21.
//
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album")
    }

    @NSManaged public var name: String?
    @NSManaged public var year: Int16
    @NSManaged public var genre: String?
    @NSManaged public var artist: Singer?
    
    var unwrappedName: String {
        name ?? "Unknown"
    }
    
    var unwrappedGenre: String {
        genre ?? "Unknown"
    }
    
    var unwrappedArtist: String {
        "\(artist?.lastName) \(artist?.firstName)"
    }

}

extension Album : Identifiable {

}
