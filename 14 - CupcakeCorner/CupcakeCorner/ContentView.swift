//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/13/21.
//


import SwiftUI

struct ContentView: View {
	@ObservedObject var order = Order()
    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Cupcakes", selection: $order.selection) {
						ForEach(0..<Order.cupcakes.count, id: \.self) {
							Text(Order.cupcakes[$0])
						}
					}
					.labelsHidden()
					.pickerStyle(SegmentedPickerStyle())
					Stepper("\(order.quantity) cupcakes", value: $order.quantity, in: 2...20)
				}
				Section {
					Toggle("Any special requests?", isOn: $order.hasSpecialRequest.animation())
					if order.hasSpecialRequest {
						Toggle("Extra frosting", isOn: $order.addExtraFrosting)
						Toggle("Extra sprinkles", isOn: $order.addSprinkles)
					}
				}
				Section {
					NavigationLink(destination: AddressView(order: self.order)) {
						Text("Delivery Details")
					}
				}
			}
			.navigationBarTitle("Cupcake Corner")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
