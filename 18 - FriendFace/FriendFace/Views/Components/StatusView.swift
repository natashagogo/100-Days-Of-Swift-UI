//
//  StatusView.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/7/21.
//

import SwiftUI

struct StatusView: View {
	var text: String
	var body: some View {
		Text(text)
		  .frame(width: 120, height: 20)
		  .foregroundColor(.white)
			.background(text == "Active" ? Color.blue: Color.gray)
		  .clipShape(RoundedRectangle(cornerRadius: 5.0))
	}
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
		StatusView(text: "Active")
    }
}
