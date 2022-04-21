//
//  ContentView.swift
//  BetterRest
//
//  Created by Natasha Godwin on 5/19/21.
//

import CoreML
import SwiftUI

/*
    To-Dos
    It doesn't make sense to set a wake up time for today. Normally, you set your alarm for tomorrow.
 
    This app would be more useful if it told you how many cups of coffee to drink, based on your desired wake-up time.
*/


struct ContentView: View {
	@State private var wakeUp = defaultWakeUpTime
	@State private var sleepAmount = 8.0
	@State private var coffeeAmount = 1.0
	
	@State private var alertTitle = ""
	@State private var alertMessage = ""
	@State private var showingAlert = false
	
	var coffeeLabel: String {
		coffeeAmount == 1.0 ? "1 cup" : "\(coffeeAmount.formatted()) cups"
	}
	
	var cupsOfCoffee: [String] {
		[String](repeating: "☕️", count: Int(coffeeAmount))
	}
	
	static var defaultWakeUpTime: Date {
		var components = DateComponents()
		components.hour = 7
		components.minute = 0
		return Calendar.current.date(from: components) ?? Date()
	}
	
    var body: some View {
		 NavigationView {
			 Form {
				 VStack(alignment: .leading) {
					 DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
					 Stepper("\(sleepAmount.formatted()) hours of sleep", value: $sleepAmount, in: 2...12, step: 0.25)
				 }
				 VStack(alignment: .leading) {
					 Stepper(coffeeLabel, value: $coffeeAmount, in: 1...10)
					 HStack {
						 ForEach(cupsOfCoffee, id: \.self) { coffee in
							Text(coffee)
						 }
					 }
				 }
			 }
			 .navigationTitle("BetterRest")
			 .toolbar {
				 Button("Calculate", action: makePrediction)
			 }
			 .alert(alertTitle, isPresented: $showingAlert) {
				  Button("OK") { }
			 } message: {
				  Text(alertMessage)
			 }
		}
			 
	}
	
	func makePrediction() {
		do {
			// Create an instance of the Calculator class
			let config = MLModelConfiguration()
			let model = try Calculator(configuration: config)
			
			// Convert wakeUp to DateComponents
			let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
			
			// Convert each component to seconds
			let hour = (components.hour ?? 0) * 60 * 60
			let minute = (components.minute ?? 0) * 60
			
			// Predicts how much sleep the user will need
			let sleepPrediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
			
			// Convert the prediction from seconds to a wake up time
			let sleepTime = wakeUp - sleepPrediction.actualSleep
			
			// Show the bedtime in an alert
			alertTitle = "You should go to bed at:"
			alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
			
		} catch {
			alertTitle = "Error"
			alertMessage = "Sorry, there was a problem figuring out your bedtime."
		}
		showingAlert = true
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
