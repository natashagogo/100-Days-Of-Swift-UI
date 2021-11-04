//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/3/21.
//

import SwiftUI

struct SkiDetailsView: View {
	let resort: Resort
    var body: some View {
		Group {
			Text("Elevation: \(resort.elevation)m").layoutPriority(1)
			Spacer().frame(height: 0) // space will only be added in landscape mode
			Text("Snow: \(resort.snowDepth)cm").layoutPriority(1)
		}
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
		SkiDetailsView(resort: Resort.example)
    }
}
