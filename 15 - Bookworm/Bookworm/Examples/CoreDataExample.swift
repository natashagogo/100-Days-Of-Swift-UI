//
//  CoreDataExample.swift
//  Bookworm
//
//  Created by Natasha Godwin on 7/31/21.
//

import SwiftUI
import CoreData

struct CoreDataExample: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
	var body: some View {
		NavigationView {
			List {
				ForEach(students, id: \.id) { student in
					Text(student.name ?? "Unknown")
				}
			}
			.navigationTitle("Students")
			.navigationBarItems(trailing: Button("Add") {
				let firstNames = ["Billie", "Taylor", "Lana", "Santi"]
				let lastNames = ["Eilish", "Swift", "Del Rey", "Gold"]
				
				let chosenFirstName = firstNames.randomElement()!
				let chosenLastName = lastNames.randomElement()!
				
				let student = Student(context: self.viewContext)
				student.id = UUID()
				student.name = "\(chosenFirstName) \(chosenLastName)"
				
				try? self.viewContext.save()
			})
		}
	}
}

struct CoreDataExample_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataExample()
    }
}
