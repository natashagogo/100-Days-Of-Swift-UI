//
//  Order.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/29/21.
//

import SwiftUI

class Order: ObservableObject {
	static let cupcakes = [
		"Chocolate",
		"Lemon",
		"Carrot",
		"Vanilla"
	]
	@Published var selection = 0
	@Published var quantity = 2
	@Published var hasSpecialRequest = false {
		didSet {
			if hasSpecialRequest == false {
				addExtraFrosting = false
				addSprinkles = false
			}
		}
	}
	@Published var addExtraFrosting = false
	@Published var addSprinkles = false
	
	@Published var name = ""
	@Published var address = ""
	@Published var city = ""
	@Published var zip = ""
	
	var hasValidAddress: Bool {
		if name.isEmpty || address.isEmpty || city.isEmpty || zip.isEmpty {
			return false
		} else {
			return true
		}
	}
	
	var cost: Double {
		 // $2 per cake
		 var cost = Double(quantity) * 2

		 // complicated cakes cost more
		 cost += (Double(selection) / 2)

		 // $1/cake for extra frosting
		 if addExtraFrosting {
			  cost += Double(quantity)
		 }

		 // $0.50/cake for sprinkles
		 if addSprinkles {
			  cost += Double(quantity) / 2
		 }

		 return cost
	}
}
