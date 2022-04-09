//
//  ContentView.swift
//  WeSplit
//
//  Created by Natasha Godwin on 5/6/21.
//

import SwiftUI

/*
 
 Requirements

 Customers can ...
 
 ✅ enter the bill amount
 ✅ enter the number of people who will share the cost
 ✅ add a tip
 ✅ get the total
 
 */


struct ContentView: View {
	@State private var billAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 15
	
	@FocusState private var isFocused: Bool
	
	let tipOptions = [
		10,
		15,
		20,
		25,
		0
	]
	
	var total: (amount: Double, amountPerPerson: Double) {
		let amount = billAmount
		let tip = billAmount * Double(tipPercentage) / 100
		let grandTotal = amount + tip
		let totalPerPerson = grandTotal / Double(numberOfPeople)
		
		return (grandTotal, totalPerPerson)
	}
    var body: some View {
		 NavigationView {
			 VStack {
				 HStack {
					 VStack {
						 Text(total.amountPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
							 .font(.largeTitle)
						 Text("Total Per Person")
							 .font(.subheadline)
					 }.padding()
					 Divider()
					 VStack {
						 Text(total.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
							 .font(.largeTitle)
						 Text("Total")
							 .font(.subheadline)
					 }.padding()
				 }
				 .frame(height: 100)
				 Form {
					 Section(header: Text("Basics")) {
						 TextField("Amount", value: $billAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
							 .keyboardType(.decimalPad)
							 .focused($isFocused)
						 Stepper("\(numberOfPeople) people", value: $numberOfPeople, in: 2...100)
					 }
					 Section(header: Text("Tip")) {
						 Picker("Tip", selection: $tipPercentage) {
							 ForEach(tipOptions, id: \.self) {
								 Text($0, format: .percent)
							 }
						 }
						 .pickerStyle(.segmented)
					 }
				 }
				 .navigationTitle("WeSplit")
				 .toolbar {
					 ToolbarItemGroup(placement: .keyboard) {
						 Spacer()
						 Button("Done") {
							 isFocused = false
						 }
					 }
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
