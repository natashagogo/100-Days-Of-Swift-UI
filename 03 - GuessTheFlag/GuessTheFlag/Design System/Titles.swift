//
//  Custom-ViewModifiers.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 4/15/22.
//

import SwiftUI


struct MainTitleView: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle.bold())
			.foregroundColor(.white)
			.padding(.vertical)
	}
}

struct SubheadlineView: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.subheadline)
	}
}

struct HeadingOneView: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle.weight(.semibold))
	}
}

struct HeadingTwoView: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title.bold())
	}
}

struct HeadingThreeView: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title2.bold())
	}
}

extension View {
	func largeTitleStyle() -> some View {
		modifier(MainTitleView())
	}
	
	func subheadlineStyle() -> some View {
		modifier(SubheadlineView())
	}
	
	func headingOneStyle() -> some View {
		modifier(HeadingOneView())
	}
	
	func headingTwoStyle() -> some View {
		modifier(HeadingTwoView())
	}
	
	func headingThreeStyle() -> some View {
		modifier(HeadingThreeView())
	}
}
