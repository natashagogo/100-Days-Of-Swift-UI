//
//  HabitDetail.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/14/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct HabitDetail: View {
    var habits: Habits
    var body: some View {
        VStack {
            Text("\(habits.items.count)")
        }
    }
}

//struct HabitDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        HabitDetail(habit: Habits)
//    }
//}


