//
//  CheckoutView.swift
//  iDine
//
//  Created by Natasha Godwin on 6/23/21.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    @State private var delivery = Delivery(method: "Pickup", date: Date())
    @State private var address = Address(street: "", city: "", zip: "")
    @State private var payment = Payment(method: "Cash", useLoyaltyPoints: false, loyaltyNumber: "")
    @State private var tip = Tip(amount: 15)
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tip.amount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            DeliveryDetails(delivery: $delivery, address: $address)
            PaymentDetails(payment: $payment)
            AddTip(tip: $tip)
            Total(tip: $tip)
            Button("Confirm order") {
                showingPaymentAlert.toggle()
            }
            
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
