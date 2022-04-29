//
//  Feedback.swift
//  WordScramble
//
//  Created by Natasha Godwin on 4/29/22.
//

import SwiftUI


struct Feedback {
	var title: String
	var message: String
	var isShowing: Bool = false
	
	mutating func giveFeedback(title: String, message: String) {
		self.title = title
		self.message = message
		self.isShowing = true
	}
	
}
