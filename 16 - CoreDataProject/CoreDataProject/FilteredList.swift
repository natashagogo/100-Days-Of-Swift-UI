//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/20/21.
//

import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) var viewContext
    var fetchRequest: FetchRequest<Album>
    
    // Fetch data based on the filter selected
    init(filter: String) {
        fetchRequest = FetchRequest<Album>(entity: Album.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Album.year, ascending: true)], predicate: NSPredicate(format: "genre CONTAINS %@", filter))
    }
    
    var albums: FetchedResults<Album> {
        // We need fetchRequest.wrappedValue here because we aren't using @FetchRequest
        fetchRequest.wrappedValue
    }
    
    var body: some View {
        List {
            ForEach(albums, id: \.self) { album in
                VStack(alignment: .leading) {
                    Text("\(album.unwrappedName)")
                    Text("\(album.unwrappedArtist)")
                    Text("\(album.unwrappedGenre)")
                        .foregroundColor(.secondary)
                }
            }
            .onDelete(perform: delete)
        }
        .onAppear(perform: loadSampleData)
    }
    
    func loadSampleData() {
        let album1 = Album(context: self.viewContext)
        album1.name = "Reputation"
        album1.year = 2017
        album1.genre = "Pop"
        album1.artist = Singer(context: self.viewContext)
        album1.artist!.lastName = "Swift"
        album1.artist!.firstName = "Taylor"
        
        
        let album2 = Album(context: self.viewContext)
        album2.name = "Norman Fucking Rockwell"
        album2.year = 2019
        album2.genre = "Alternative"
        album1.artist = Singer(context: self.viewContext)
        album1.artist!.lastName = "Del Rey"
        album1.artist!.firstName = "Lana"
        
        let album3 = Album(context: self.viewContext)
        album3.name = "Haiku Hands"
        album2.year = 2020
        album3.genre = "Electronic"
        album1.artist = Singer(context: self.viewContext)
        album1.artist!.lastName = "Hands"
        album1.artist!.firstName = "Haiku"

        try? self.viewContext.save()
    }
    
    func delete(at locations: IndexSet) {
        for location in locations {
            // Find item in fetch request
            let item = albums[location]
            // Delete it from the viewContext
            viewContext.delete(item)
        }
        // Save changes
        try? viewContext.save()
    }
}
