//
//  ProgressView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Progress")
            }
            .navigationTitle("Progress")
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
