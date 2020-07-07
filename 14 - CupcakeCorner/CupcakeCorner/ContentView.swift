//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Options", selection: $order.selection) {
                       ForEach(0..<Order.options.count, id: \.self) {
                           Text("\(Order.options[$0])")
                       }
                   }.pickerStyle(SegmentedPickerStyle())
                                   
                   Stepper(value: $order.quantity, in: 2...20) {
                       HStack {
                           Text("Number of Cakes")
                           Spacer()
                           Text("\(order.quantity)")
                       }
                   }
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.hasSpecialRequest.animation())
                    
                    if order.hasSpecialRequest {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Details")
                    }
                }
            } .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
