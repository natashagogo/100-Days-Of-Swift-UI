//
//  Order.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/13/21.
//

import Foundation

class Order: ObservableObject {
    static let types = [
        "Vanilla",
        "Strawberry",
        "Chocolate",
        "Rainbow"
    ]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestEnabled = false {
        didSet {
            // Make sure extraFrosting and addSprinkles are always hidden when there are no special requests
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
}
