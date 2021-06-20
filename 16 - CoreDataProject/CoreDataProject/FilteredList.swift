//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/20/21.
//

import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) var viewContext
    var fetchRequest: FetchRequest<Singer>
    
    // Fetch data based on the filter selected
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
    
    var singers: FetchedResults<Singer> {
        fetchRequest.wrappedValue
    }
    
    var body: some View {
        // We need fetchRequest.wrappedValue here because we aren't using @FetchRequest
        List {
            ForEach(singers, id: \.self) { singer in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            .onDelete(perform: delete)
        }
        .onAppear(perform: loadSampleData)
    }
    
    func loadSampleData() {
        let taylor = Singer(context: self.viewContext)
        taylor.firstName = "Taylor"
        taylor.lastName = "Swift"

        let ed = Singer(context: self.viewContext)
        ed.firstName = "Ed"
        ed.lastName = "Sheeran"

        let adele = Singer(context: self.viewContext)
        adele.firstName = "Adele"
        adele.lastName = "Adkins"

        try? self.viewContext.save()
    }
    
    func delete(at locations: IndexSet) {
        for location in locations {
            // Find item in fetch request
            let item = singers[location]
            // Delete it from the viewContext
            viewContext.delete(item)
        }
        // Save changes
        try? viewContext.save()
    }
}
