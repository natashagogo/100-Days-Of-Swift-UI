//
//  Order.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

class Order: ObservableObject, Codable {
    // Specifies properties that need to be saved
    enum CodingKeys: CodingKey {
        case selection, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
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
    
    // Creates a container using the enum above
    // Write out all the properties attached to each key
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // Since this method is marked with throws,
        // there isn't a need for catch statements.
        try container.encode(selection, forKey: .selection)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    // Decodes an instance of Order from some archived data
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        selection = try container.decode(Int.self, forKey: .selection)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    // Allows a new order to be created without any data
    // Without this extra initializer, the code won't compile 
    init() {
        
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
