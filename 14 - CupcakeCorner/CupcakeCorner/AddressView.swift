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
        Text("Add your address here.")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
