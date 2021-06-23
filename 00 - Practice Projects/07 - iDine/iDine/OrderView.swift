//
//  OrderView.swift
//  iDine
//
//  Created by Natasha Godwin on 6/22/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
           NavigationView {
               List {
                   Section {
                       ForEach(order.items) { item in
                           HStack {
                               Text(item.name)
                               Spacer()
                               Text("$\(item.price)")
                           }
                       }
                       .onDelete(perform: deleteItems)
                   }

                   Section {
                       NavigationLink(destination: CheckoutView()) {
                           Text("Place Order")
                       }
                   }
                   .disabled(order.items.isEmpty)
               }
               .navigationTitle("Order")
               .navigationBarItems(leading: EditButton())
               .listStyle(InsetGroupedListStyle())
        }
    }
    
    func deleteItems(at locations: IndexSet) {
        order.items.remove(atOffsets: locations)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
