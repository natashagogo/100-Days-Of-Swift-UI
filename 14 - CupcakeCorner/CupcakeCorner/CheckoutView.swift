//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/13/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        Text("Ready to check out?")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
