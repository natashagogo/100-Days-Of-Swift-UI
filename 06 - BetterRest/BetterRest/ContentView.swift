//
//  ContentView.swift
//  BetterRest
//
//  Created by Natasha Godwin on 5/19/21.
//

import SwiftUI

/*
    NOTES
    This app would be more useful if it told you how many cups of coffee to drink, based on your desired wake-up time.
*/


struct ContentView: View {
	@State private var sleepAmount = 8.0
	@State private var wakeUp = Date.now
	
    var body: some View {
		 Form {
			 Text(wakeUp.formatted(date: .long, time: .shortened))
			 Text(wakeUp, format: .dateTime.hour().minute())
			 DatePicker("Date", selection: $wakeUp, in: Date.now...)
				 .labelsHidden()
			 Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 2...20, step: 0.25)
		 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
