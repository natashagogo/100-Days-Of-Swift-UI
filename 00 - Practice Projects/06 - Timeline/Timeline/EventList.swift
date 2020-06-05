//
//  Timeline.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation

class EventList: ObservableObject {
    @Published var list = [Event]()
}
