//
//  Order.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/29/21.
//

import SwiftUI

class Order: ObservableObject, Codable {
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
	
	// Tells Swift which properties need to be saved
	enum CodingKeys: CodingKey {
		case selection
		case quantity
		case addExtraFrosting
		case addSprinkles
		case name
		case address
		case city
		case zip
	}
	
	// Converts the data to JSON, so it can be sent over the Internet
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(selection, forKey: .selection)
		try container.encode(quantity, forKey: .quantity)

		try container.encode(addExtraFrosting, forKey: .addExtraFrosting)
		try container.encode(addSprinkles, forKey: .addSprinkles)
		
		try container.encode(name, forKey: .name)
		try container.encode(address, forKey: .address)
		try container.encode(city, forKey: .city)
		try container.encode(zip, forKey: .zip)
	}
	
	// Converts archived data to Swift objects
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		selection = try container.decode(Int.self, forKey: .selection)
		quantity = try container.decode(Int.self, forKey: .quantity)

		addExtraFrosting = try container.decode(Bool.self, forKey: .addExtraFrosting)
		addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
		
		name = try container.decode(String.self, forKey: .name)
		address = try container.decode(String.self, forKey: .address)
		city = try container.decode(String.self, forKey: .city)
		zip = try container.decode(String.self, forKey: .zip)
		
	}
	
	// Allows an instance of Order to be created, even if it doesn't have any data
	init() {}
	
}
