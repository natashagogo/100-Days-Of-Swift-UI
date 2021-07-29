//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/29/21.
//

import SwiftUI

struct CheckoutView: View {
	@ObservedObject var order: Order
    var body: some View {
		GeometryReader { geometry in
			 ScrollView {
				  VStack {
						Image("cupcakes")
							 .resizable()
							 .scaledToFit()
							 .frame(width: geometry.size.width)

						Text("Your total is $\(self.order.cost, specifier: "%.2f")")
							 .font(.title)

						Button("Place Order") {
							 // place the order
						}
						.padding()
				  }
			 }
		}
		.navigationBarTitle("Check out", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
		CheckoutView(order: Order())
    }
}
