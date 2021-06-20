//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/19/21.
//

import SwiftUI
import CoreData

/*
 
 NSPredicate
 
 %@
 
 Operators commonly used with predicates
  IN - Checks whether it matches items in an array
 BEGINSWITH - Checks whether a string begins with a certain letter
 CONTAINS - Checks whether a string contains certain characters
 NOT - Checks the inverse of a predicate
 
 Creating Generic Filtered Lists
 
 @ViewBuilder
 @escaping
 %K
 
 Creating Relationships
 
 one-to-one: one entity maps to another (one industry for one country)
 one-to-many: one entity maps to many entities (one industry in multiple countries)
 many-to-one: many entities link to one entity (multiple industries in one country)
 Many-to-Many: many entities link to multiple entities (multiple industries in multiple countries)
 
 */


struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>

    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            .navigationBarTitle("Candy Inventions")
            .navigationBarItems(trailing: Button("Add") {
                let candy1 = Candy(context: self.viewContext)
                candy1.name = "Mars"
                candy1.origin = Country(context: self.viewContext)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"

                let candy2 = Candy(context: self.viewContext)
                candy2.name = "KitKat"
                candy2.origin = Country(context: self.viewContext)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"

                let candy3 = Candy(context: self.viewContext)
                candy3.name = "Twix"
                candy3.origin = Country(context: self.viewContext)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"

                let candy4 = Candy(context: self.viewContext)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: self.viewContext)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"

                try? self.viewContext.save()
            })

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
