//
//  ProgressBar.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/30/21.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Int
    var body: some View {
        Stepper("Progress: \(value)", value: $value, in: 0...100, step: 100)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(0))
    }
}
