//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/13/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                    .keyboardType(.alphabet)
                TextField("Street Address", text: $order.streetAddress)
                    .keyboardType(.default)
                TextField("City", text: $order.city)
                    .keyboardType(.alphabet)
                TextField("Zip", text: $order.zip)
                    .keyboardType(.numberPad)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
            
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
