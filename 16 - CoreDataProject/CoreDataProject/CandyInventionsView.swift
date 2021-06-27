//
//  CandyInventionsView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/27/21.
//

import SwiftUI
import CoreData


struct CandyInventionsView: View {
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

struct CandyInventionsView_Previews: PreviewProvider {
    static var previews: some View {
        CandyInventionsView()
    }
}
