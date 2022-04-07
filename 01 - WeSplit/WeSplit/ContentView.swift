//
//  ContentView.swift
//  WeSplit
//
//  Created by Natasha Godwin on 5/6/21.
//

import SwiftUI


struct ContentView: View {
	let interns: [String] = [
		"Meredith Grey",
		"Christina Yang",
		"Alex Karev",
		"Izzy Stevens",
		"George O'Malley"
	]
	
	@State private var onCall = "Meredith Grey"
	
    var body: some View {
		 Form {
			 Section(header: Text("Interns")) {
				 Picker("Interns", selection: $onCall) {
					 ForEach(interns, id: \.self) { intern in
						 Text(intern)
					 }
				 }
				 .pickerStyle(WheelPickerStyle())
	
			 }
			 Section(header: Text("On Call")) {
				 Text(onCall)
			 }
			 
			 
		 }
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
