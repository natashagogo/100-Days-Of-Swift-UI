//
//  Order.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    static let options = ["Vanilla", "Chocolate", "Lemon"]
    
    @Published var selection = 2
    @Published var quantity = 2
    
    @Published var hasSpecialRequest = false {
           didSet {
               if hasSpecialRequest == false {
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
        // TO DO: Make sure name, streetAddress, and city are strings and zip is an integer
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // Complicated cakes cost more
        cost += (Double(selection) / 2)
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity / 2)
        }
        
        return cost
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
