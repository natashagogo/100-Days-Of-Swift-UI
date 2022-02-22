//
//  ContentView.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/9/21.


import SwiftUI

struct ContentView: View {
    var body: some View {
		 Polygon(sides: 6)
			  .fill(Color.blue)
			  .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
