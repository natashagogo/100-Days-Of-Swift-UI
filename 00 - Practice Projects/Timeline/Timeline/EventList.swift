//
//  EventList.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/3/21.
//

import Foundation

class EventList: ObservableObject {
    @Published var list = [Event]()
}
