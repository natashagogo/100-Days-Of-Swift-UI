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
	@State private var wakeUp = Date.now
	@State private var sleepAmount = 8.0
	@State private var coffeeAmount = 1.0
	
	var coffeeLabel: String {
		coffeeAmount == 1.0 ? "1 cup" : "\(coffeeAmount.formatted()) cups"
	}
	
	var cupsOfCoffee: [String] {
		[String](repeating: "☕️", count: Int(coffeeAmount))
	}
	
    var body: some View {
		 NavigationView {
			 Form {
				 Section {
					 DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
					 Stepper("\(sleepAmount.formatted()) hours of sleep", value: $sleepAmount, in: 2...12, step: 0.25)
					 Group {
						 Stepper(coffeeLabel, value: $coffeeAmount, in: 1...10)
						 HStack {
							 ForEach(cupsOfCoffee, id: \.self) { coffee in
								Text(coffee)
							 }
						 }
					 }
				 }
			 }
			 .navigationTitle("BetterRest")
			 .toolbar {
				 Button("Calculate", action: makePrediction)
			 }
		 }
    }
	
	func makePrediction() {
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
