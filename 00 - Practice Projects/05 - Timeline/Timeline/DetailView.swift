//
//  DetailView.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/5/21.
//

import SwiftUI

struct DetailView: View {
    let event: Event
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.text)
                .padding(25)
            Spacer()
        }
        .navigationBarTitle(Text(event.date), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let events = [Event]()
    static var previews: some View {
        DetailView(event: events[0])
    }
}
