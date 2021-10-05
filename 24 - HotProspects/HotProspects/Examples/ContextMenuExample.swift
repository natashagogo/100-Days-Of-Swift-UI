//
//  ContextMenuExample.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/5/21.
//

import SwiftUI


struct ContextMenuExample: View {
	@State private var backgroundColor = Color.blue
    var body: some View {
		 VStack {
			Rectangle()
				.fill(backgroundColor)
				.frame(width: 100, height: 100)
				.contextMenu(ContextMenu(menuItems: {
					Button(action: {
						backgroundColor = Color.purple
					}) {
						Text("Purple")
						Image(systemName: "circle.fill")
							.foregroundColor(.purple)
					}
					Button(action: {
						backgroundColor = Color.black
					}) {
						Text("Black")
						Image(systemName: "circle.fill")
							.foregroundColor(.black)
					}
					Button(action: {
						backgroundColor = Color.green
					}) {
						Text("Green")
						Image(systemName: "circle.fill")
							.foregroundColor(.green)
					}
				}))
		}
    }
}

struct ContextMenuExample_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuExample()
    }
}
