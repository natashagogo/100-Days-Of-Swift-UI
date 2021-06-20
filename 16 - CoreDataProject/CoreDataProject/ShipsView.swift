//
//  ShipsView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/20/21.
//

import SwiftUI

struct Ships: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])) var ships: FetchedResults<Ship>

    var body: some View {
        NavigationView {
            List {
                ForEach(ships, id: \.self) { ship in
                    VStack(alignment: .leading) {
                        Text(ship.name ?? "Unknown")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(ship.universe ?? "Unknown")
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete(perform: delete)
                
            }
            .navigationBarTitle("iShip")
            .navigationBarItems(leading: EditButton(), trailing: Button("Add Examples") {
                let ship1 = Ship(context: self.viewContext)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: self.viewContext)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: self.viewContext)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: self.viewContext)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"

                try? self.viewContext.save()
            })
        }
    }
    
    func delete(at locations: IndexSet) {
        for location in locations {
            // Find item in fetch request
            let item = ships[location]
            // Delete it from the viewContext
            viewContext.delete(item)
        }
        // Save changes
        try? viewContext.save()
    }
}


