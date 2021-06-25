//
//  AddTip.swift
//  iDine
//
//  Created by Natasha Godwin on 6/25/21.
//

import SwiftUI

struct Tip {
    let options = [10, 15, 20, 25, 0]
    var amount: Int
    
}

struct AddTip: View {
    @Binding var tip: Tip
    
    var body: some View {
        Section(header: Text("Add a tip?")) {
            Picker("Percentage", selection: $tip.amount) {
                ForEach(tip.options, id: \.self) {
                    Text("\($0)%")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
