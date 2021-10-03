//
//  Photos.swift
//  MatchPic
//
//  Created by Natasha Godwin on 10/2/21.
//

import SwiftUI

struct Photo: Identifiable {
	var id = UUID()
	var image: Image
	var name: String
}
