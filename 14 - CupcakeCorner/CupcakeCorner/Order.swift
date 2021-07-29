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
	
}
