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
    
}
