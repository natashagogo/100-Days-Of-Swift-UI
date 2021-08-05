//
//  DateExtension.swift
//  Bookworm
//
//  Created by Natasha Godwin on 8/5/21.
//

import SwiftUI

extension Date {
	func formatted() -> String {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		return formatter.string(from: self)
	}
}
