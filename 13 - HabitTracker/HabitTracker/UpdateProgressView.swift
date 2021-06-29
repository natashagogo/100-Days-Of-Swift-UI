//
//  UpdateProgressView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

struct UpdateProgressView: View {
    @State private var progress = 0
    var body: some View {
        VStack {
            Text("\(progress)% Complete")
                .font(.largeTitle)
            Stepper("", value: $progress, in: 0...100, step: 100)
                .labelsHidden()
        }
        .navigationBarTitle("Habit Progress", displayMode: .inline)
    }
}

struct UpdateProgressView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProgressView()
    }
}
