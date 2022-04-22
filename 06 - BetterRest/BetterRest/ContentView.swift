//
//  ContentView.swift
//  BetterRest
//
//  Created by Natasha Godwin on 5/19/21.
//

import CoreML
import SwiftUI

/*
	The core insight of this app - the more coffee you drink, the earlier you have to go to bed - isn't clear.
 
   How should you visualize it?
*/


struct ContentView: View {
	@State private var wakeUp = defaultWakeUpTime
	@State private var sleepAmount = 8.0
	@State private var coffeeAmount = 1.0
	
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
	
	/*
	 This can be turned into a method, but it's written as a computed property
	 because it's better to just show the user the result.
	 */
	var prediction: String {
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
			return sleepTime.formatted(date: .omitted, time: .shortened)
			
		} catch {
			return "Error"
		}
	}
	
	init(){
	  UITableView.appearance().backgroundColor = .clear
	  UITableViewCell.appearance().backgroundColor = UIColor.clear
	  UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
	 }
	
    var body: some View {
		 NavigationView {
			 ZStack {
				Image("night")
					.resizable()
					.scaledToFill()
					.ignoresSafeArea()
				 Form {
					 Section(header: Text("Bedtime").foregroundColor(.white)) {
						Text(prediction)
						 .font(.title3)
					 }
					Section {
						DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
						Stepper("\(sleepAmount.formatted()) hours of sleep", value: $sleepAmount, in: 2...12, step: 0.25) 
						VStack(alignment: .leading) {
							Stepper(coffeeLabel, value: $coffeeAmount, in: 0...10)
							HStack {
								ForEach(cupsOfCoffee, id: \.self) { coffee in
								Text(coffee)
						}
					}
				}
			}
		  }
			.navigationTitle("BetterRest")
			.navigationBarHidden(false)
		 }
     }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
