//
//  Total.swift
//  iDine
//
//  Created by Natasha Godwin on 6/25/21.
//

import SwiftUI

struct Total: View {
    @EnvironmentObject var order: Order
    @Binding var tip: Tip
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tip.amount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Section(header:
            Text("Total: \(totalPrice)")
                .font(.headline)
                .fontWeight(.bold)
             ) {
        }
    }
}

