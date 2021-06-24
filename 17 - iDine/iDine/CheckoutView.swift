//
//  CheckoutView.swift
//  iDine
//
//  Created by Natasha Godwin on 6/23/21.
//

import SwiftUI

/*
 Questions
 
 How would you limit the time in a DatePicker, e.g. making customers unable to select times outside of business hours?
 
 */

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentOptions = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentOption = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    let deliveryOptions = ["Pickup", "Delivery"]
    @State private var deliveryOption = "Pickup"
    @State private var pickupDate = Date()
    @State private var street = ""
    @State private var city = ""
    @State private var zip = ""
    
    var pickupRange: ClosedRange<Date> = {
        let now = Date()
        let twoDaysFromNow = Calendar.current.date(byAdding: .day, value: 2, to: now)!
        return now...twoDaysFromNow
    }()
    
    var deliveryRange: ClosedRange<Date> = {
        let now = Date()
        let oneWeekFromNow = Calendar.current.date(byAdding: .weekday, value: 14, to: now)!
        return now...oneWeekFromNow
    }()
    
    var body: some View {
        Form {
            Section(header: Text("Delivery Method")) {
                Picker("", selection: $deliveryOption) {
                    ForEach(deliveryOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if deliveryOption == "Pickup" {
                    // Customers who select delivery can order two days in advance
                    DatePicker("", selection: $pickupDate, in: pickupRange)
                        .labelsHidden()
                } else {
                    TextField("Street", text: $street)
                    TextField("City", text: $city)
                    TextField("Street", text: $zip)
                    // Customers who select delivery can order two weeks in advance
                    DatePicker("", selection: $pickupDate, in: deliveryRange)
                        .labelsHidden()
                }
            }
            Section(header: Text("Payment details")) {
                Picker("How do you want to pay?", selection: $paymentOption) {
                    ForEach(paymentOptions, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                Text("Total: \(totalPrice)")
                    .font(.headline)
                    .fontWeight(.bold)
                 ) {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice). Thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
