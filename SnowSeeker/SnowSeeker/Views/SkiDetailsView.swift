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
		VStack(alignment: .leading) {
			Text("Elevation: \(resort.elevation)m")
			Text("Snow: \(resort.snowDepth)cm")
		}
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
		SkiDetailsView(resort: Resort.example)
    }
}
