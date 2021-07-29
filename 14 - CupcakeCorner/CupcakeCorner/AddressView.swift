//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/29/21.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject var order: Order
	var body: some View {
		Form {
			Section {
				TextField("Name", text: $order.name)
				TextField("Street Address", text: $order.address)
				TextField("City", text: $order.city)
				TextField("Zip Code", text: $order.zip)
			}
			Section {
				NavigationLink(destination: CheckoutView(order: self.order)) {
					Text("Check Out")
				}
			}
		}
		.navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
		AddressView(order: Order())
    }
}
