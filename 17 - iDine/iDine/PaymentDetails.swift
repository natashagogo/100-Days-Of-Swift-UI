//
//  PaymentDetails.swift
//  iDine
//
//  Created by Natasha Godwin on 6/25/21.
//

import SwiftUI

struct Payment {
    let methods = ["Cash", "Credit Card", "iDine Points"]
    var method = "Cash"
    var useLoyaltyPoints: Bool
    var loyaltyNumber: String
}

struct PaymentDetails: View {
    @Binding var payment: Payment
    var body: some View {
        Section(header: Text("Payment details")) {
            Picker("How do you want to pay?", selection: $payment.method) {
                ForEach(payment.methods, id: \.self) {
                    Text($0)
                }
            }
            Toggle("Add iDine loyalty card", isOn: $payment.useLoyaltyPoints.animation())
            if payment.useLoyaltyPoints == true {
                TextField("Enter your iDine ID", text: $payment.loyaltyNumber)
            }
        }
    }
}
