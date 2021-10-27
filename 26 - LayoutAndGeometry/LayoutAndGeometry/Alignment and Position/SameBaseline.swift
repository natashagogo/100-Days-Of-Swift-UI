//
//  SameBaseline.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/26/21.
//

import SwiftUI

struct SameBaseline: View {
	var body: some View {
		HStack(alignment: .lastTextBaseline) {
			 Text("Live")
				  .font(.caption)
			 Text("long")
			 Text("and")
				  .font(.title)
			 Text("prosper")
				  .font(.largeTitle)
		}
	}
}

struct SameBaseline_Previews: PreviewProvider {
    static var previews: some View {
        SameBaseline()
    }
}
