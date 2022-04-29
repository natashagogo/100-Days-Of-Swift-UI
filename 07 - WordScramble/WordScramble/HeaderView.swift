//
//  HeaderView.swift
//  WordScramble
//
//  Created by Natasha Godwin on 4/29/22.
//

import SwiftUI

struct HeaderView: View {
	let points: Int
	
	var body: some View {
		if points > 0 {
			Text("Points: \(points)")
				.textCase(.none)
				.font(.headline)
		}
	}
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
		 HeaderView(points: 50)
    }
}
