//
//  ContentView.swift
//  TimeTraveler
//
//  Created by Natasha Godwin on 5/9/21.
//

import SwiftUI

/*
 Requirements
 
 ✅ Users can see the time since and before an event.
	If the user chooses a date in the past, show the time since the event.
	If they choose one in the future, show the time until.
 
 ✅ Users can choose units
 
 */


struct ContentView: View {
	@State private var eventName = ""
	@State private var date = Date()
	@State private var unit = "all"
	
	let units = [
		"days",
		"weeks",
		"months",
		"years",
		"all",
	]
	
	/*
	 TO DO
	 
	 1. The label should reflect the units selected.
	 2. It would also be better to use Calendar.current.date(byAdding: ) than the one below.
	 */
	var calculateTime: String {
		let now = Date()
		
		let timeUntil = Calendar.current.dateComponents([.year, .month, .day], from: Date(), to: date)
		let timeSince = Calendar.current.dateComponents([.year, .month, .day], from: date, to: Date())
		
		if date == now {
			return "Present"
		} else if date < now {
			return "\(timeSince.year!) years, \(timeSince.month!) months, \(timeSince.day!) days since"
		} else {
			return "\(timeUntil.year!) years, \(timeUntil.month!) months, \(timeUntil.day!) days until"
		}
	}
	
 var body: some View {
	 NavigationView {
		 Form {
			 Section(header: Text("Significant Date")) {
				 TextField("Name", text: $eventName)
				 DatePicker("Date", selection: $date)
			 }
			 Section(header: Text("Units")) {
				 Picker("Units", selection: $unit) {
					 ForEach(units, id: \.self) { unit in
						 Text(unit)
					 }
				 }
			 }.pickerStyle(.segmented)
		 }
		 .toolbar {
			 ToolbarItem(placement: .navigationBarLeading) {
				 VStack(alignment: .leading, spacing: 10) {
					 Text(calculateTime)
						 .font(.subheadline)
						 .foregroundColor(Color.blue)
					 if eventName == "" {
						 Text("Special Event")
							 .font(.largeTitle)
					 } else {
						 Text(eventName)
							 .font(.largeTitle)
					 }
				 }.padding(.top, 100)
			 }
		 }

	 }
  }
	
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
