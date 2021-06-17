//
//  Timeline.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/3/21.
//

import SwiftUI

struct Timeline: View {
    @ObservedObject var events: EventList
    var body: some View {
        List {
            ForEach(events.list) { event in
                NavigationLink(destination: DetailView(event: event)) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(event.date)
                            .font(.caption)
                            .foregroundColor(.blue)
                        Text(event.text)
                    }
                }
            }
            .onDelete(perform: delete)
        }
   }
    func delete(at location: IndexSet) {
        events.list.remove(atOffsets: location)
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline(events: EventList())
    }
}
