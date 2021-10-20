//
//  Timers.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//

import SwiftUI

struct Timers: View {
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	@State private var counter = 0
    var body: some View {
        Text("Hello, World!")
			.onReceive(timer, perform: { time in
				if self.counter == 5 {
					self.timer.upstream.connect().cancel() // stop the timer
				} else {
					print("The time is now \(time).")
				}
				self.counter += 1
			})
    }
}

struct Timers_Previews: PreviewProvider {
    static var previews: some View {
        Timers()
    }
}
