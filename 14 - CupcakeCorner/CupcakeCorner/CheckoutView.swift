//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/10/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    Button("Place Order") {
                        
                    }
                    .padding()
                }
            }
        }.navigationBarTitle("Check Out", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
