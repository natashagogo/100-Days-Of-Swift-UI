//
//  DetailView.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/5/21.
//

import SwiftUI

struct DetailView: View {
    var symptom: Symptom
    var body: some View {
        VStack {
            Text("This symptom started on \(symptom.date)")
                .padding(20)
            Spacer()
        }
        .navigationBarTitle(Text(symptom.name.capitalized), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let symptoms = [Symptom]()
    static var previews: some View {
        DetailView(symptom: symptoms[0])
    }
}
