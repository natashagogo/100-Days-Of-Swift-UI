//
//  ViewStates.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI

enum Layouts {
	case doubleColumn, singleColumn
}

struct DoubleColumn: View {
	 var body: some View {
		HStack {
			Text("Hello, World!")
			Text("Hello, World!")
		}
		.padding(20)
	 }
}

struct SingleColumn: View {
	 var body: some View {
		VStack {
			Text("Hello, World!")
			Text("Hello, World!")
		}
		.padding(20)
	 }
}




struct ViewStates: View {
	@State private var loadingState = Layouts.singleColumn
	
    var body: some View {
		VStack {
			HStack {
				Button("Single Column") {
					loadingState = Layouts.singleColumn
				}
				Button("Double Column") {
					loadingState = Layouts.doubleColumn
				}
			}
			Group {
				 if loadingState == .doubleColumn {
					  DoubleColumn()
				 } else if loadingState == .singleColumn {
					  SingleColumn()
				 }
			}
		}
    }
}

struct ViewStates_Previews: PreviewProvider {
    static var previews: some View {
        ViewStates()
    }
}
