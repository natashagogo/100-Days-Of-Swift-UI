//
//  Constraints.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/9/21.
//

import SwiftUI

/*


*/

struct Constraints: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: Person.entity(), sortDescriptors: []) var people: FetchedResults<Person>
	
    var body: some View {
		VStack {
			List(people, id: \.self) { person in
				Text(person.name ?? "Unknown")
			}
			Button("Add") {
				/*
				This will throw an error because the name attribute
				is listed as a constraint in Person.
				Check the Inspector in the data model.
				*/
				let person = Person(context: self.viewContext)
				person.name = "Devi Vishwakumar"
			}
		}
		.navigationBarTitle("Contacts", displayMode: .inline)
		.navigationBarItems(trailing: Button("Save") {
			do {
				try self.viewContext.save()
			} catch {
				print(error.localizedDescription)
			}
		})
    }
}

struct Constraints_Previews: PreviewProvider {
    static var previews: some View {
        Constraints()
    }
}
