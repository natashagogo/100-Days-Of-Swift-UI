//
//  ManualPublishingExample.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/4/21.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
	var value = 0 {
		willSet {
			objectWillChange.send()
		}
	}

	 init() {
		  for i in 1...10 {
				DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
					 self.value += 1
				}
		  }
	 }
}

struct ManualPublishingExample: View {
	@ObservedObject var updater = DelayedUpdater()
    var body: some View {
		 Text("Value is: \(updater.value)")
    }
}

struct ManualPublishingExample_Previews: PreviewProvider {
    static var previews: some View {
        ManualPublishingExample()
    }
}
