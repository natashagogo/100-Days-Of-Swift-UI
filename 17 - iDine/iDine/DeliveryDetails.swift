//
//  DeliveryDetails.swift
//  iDine
//
//  Created by Natasha Godwin on 6/25/21.
//

import SwiftUI

struct Delivery {
    let methods = ["Pickup", "Delivery"]
    var method: String
    var date: Date
}

struct Address {
    var street: String
    var city: String
    var zip: String
}

struct DeliveryDetails: View {
    @Binding var delivery: Delivery
    @Binding var address: Address
    
    var pickupOptions: ClosedRange<Date> = {
        let now = Date()
        let twoDaysFromNow = Calendar.current.date(byAdding: .day, value: 2, to: now)!
        return now...twoDaysFromNow
    }()
    
    var deliveryOptions: ClosedRange<Date> = {
        let now = Date()
        let oneWeekFromNow = Calendar.current.date(byAdding: .weekday, value: 14, to: now)!
        return now...oneWeekFromNow
    }()
    
    var body: some View {
        Section(header: Text("Delivery Method")) {
            Picker("", selection: $delivery.method) {
                ForEach(delivery.methods, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if delivery.method == "Pickup" {
                // Customers who select delivery can order two days in advance
                DatePicker("", selection: $delivery.date, in: pickupOptions)
                    .labelsHidden()
            } else {
                TextField("Street", text: $address.street)
                TextField("City", text: $address.city)
                TextField("Zip", text: $address.zip)
                // Customers who select delivery can order two weeks in advance
                DatePicker("", selection: $delivery.date, in: deliveryOptions)
                    .labelsHidden()
            }
        }
    }
}
