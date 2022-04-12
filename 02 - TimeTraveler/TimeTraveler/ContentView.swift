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
 
 Notes
 
 For learning purposes, I'm not using Text(Date, style: .relative) or any other out-of-box solutions from Apple.
 
 TO-DOS
 
 Clean up code. 
 
 */


struct ContentView: View {
	@State private var eventName = ""
	@State private var date = Date()
	@State private var unit = Time.days
	let now = Date()
	
	enum Time: String {
		case minutes = "minutes"
		case hours = "hours"
		case days = "days"
		case weeks = "weeks"
		case months = "months"
		case years = "years"
	}
	
	let units = [
		Time.minutes,
		Time.hours,
		Time.days,
		Time.weeks,
		Time.months,
		Time.years
	]
	
	var setUnit: Set<Calendar.Component> {
		switch unit {
		 case Time.minutes:
			  return [.minute]
		 case Time.hours:
		  return [.hour]
		 case Time.weeks:
		  return [.weekOfYear]
		 case Time.months:
		 return [.month]
		 case Time.years:
		 return [.year]
		default:
		 return [.day]
		}
	}
	
	var calculateTime: DateComponents {
		let isPast = date < now
		let components: DateComponents
		
		if isPast {
			components = Calendar.current.dateComponents(setUnit, from: date, to: now)
		} else {
			components = Calendar.current.dateComponents(setUnit, from: now, to: date)
		}
		
		return components
	}
	
	var label: String {
       let components = calculateTime
		 var labelUnit: Int?
		
		switch unit {
		  case Time.minutes:
			labelUnit = components.minute
		  case Time.hours:
			labelUnit = components.hour
		 case Time.weeks:
			labelUnit = components.weekOfYear
		 case Time.months:
			labelUnit = components.month
		 case Time.years:
			labelUnit = components.year
		  default:
			labelUnit = components.day
		}
		
		let preposition = date < now ? "since" : "until"
		let unwrappedLabel = "\(labelUnit ?? 0) \(unit) \(preposition)"
		
		return unwrappedLabel
	}
	
	
 var body: some View {
	 NavigationView {
		 Form {
			 Section(header: Text("Special Event")) {
				 TextField("Name", text: $eventName)
					 .autocapitalization(.none)
				 DatePicker("Date", selection: $date)
			 }
			 Section(header: Text("Units")) {
				 Picker("Units", selection: $unit) {
					 ForEach(units, id: \.self) { unit in
						 Text(unit.rawValue)
					 }
				 }
				 .pickerStyle(.wheel)
			 }
		 }
		 .toolbar {
			 ToolbarItem(placement: .navigationBarLeading) {
				 VStack(alignment: .leading, spacing: 10) {
					 Text(label)
						 .font(.headline)
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
