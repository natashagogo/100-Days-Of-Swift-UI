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
	@State private var bill = Bill()
	@State private var progress = 5.0
	@FocusState private var isFocused: Bool
	
    var body: some View {
		 NavigationView {
			 VStack {
				 TotalView(total: bill.calculateTotal.amount, totalPerPerson: bill.calculateTotal.amountPerPerson,
					numberOfPeople: bill.numberOfPeople
				 )
				 Form {
					 Section(header: Text("Basics")) {
						 TextField("Amount", value: $bill.total, format: .currency(code: Locale.current.currencyCode ?? "USD"))
							 .keyboardType(.decimalPad)
							 .focused($isFocused)
						 Stepper("\(bill.numberOfPeople) people", value: $bill.numberOfPeople, in: 2...100)
					 }
					 Section(header: Text("Tip")) {
						 Picker("Tip", selection: $bill.tipPercentage) {
							 ForEach(Bill.tipOptions, id: \.self) {
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
