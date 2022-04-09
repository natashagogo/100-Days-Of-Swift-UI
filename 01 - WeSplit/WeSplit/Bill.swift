//
//  Bill.swift
//  WeSplit
//
//  Created by Natasha Godwin on 4/9/22.
//

import Foundation

struct Bill {
	var total: Double = 0.0
	var numberOfPeople: Int = 2
	var tipPercentage: Int = 15
	
	static let tipOptions = [
		10,
		15,
		20,
		25,
		0
	]
	
	var calculateTotal: (amount: Double, amountPerPerson: Double) {
		let amount = total
		let tip = total * Double(tipPercentage) / 100
		let grandTotal = amount + tip
		let totalPerPerson = grandTotal / Double(numberOfPeople)
		
		return (grandTotal, totalPerPerson)
	}
}
