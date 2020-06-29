//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/28/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
