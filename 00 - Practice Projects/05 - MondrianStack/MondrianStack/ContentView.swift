//
//  ContentView.swift
//  MondrianStack
//
//  Created by Natasha Godwin on 4/11/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct MondrianSquare: ViewModifier {
    var width: CGFloat = 0
    var height: CGFloat = 0
    var color: Color = .white
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
}

extension View {
    func mondrianStyle(width: CGFloat, height: CGFloat, color: Color) -> some View {
        self.modifier(MondrianSquare(width: width, height: height, color: color))
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                // Row 1
                HStack {
                    Rectangle()
                       .mondrianStyle(width: 50, height: 100, color: .red)
                    Rectangle()
                       .mondrianStyle(width: 300, height: 100, color: .white)
                    Rectangle()
                       .mondrianStyle(width: 50, height: 100, color: .white)
                }
                 .frame(maxWidth: .infinity, maxHeight: 100)
                
                // Row 2
                HStack {
                   Rectangle()
                      .mondrianStyle(width: 50, height: 300, color: .white)
                   Rectangle()
                      .mondrianStyle(width: 300, height: 300, color: .white)
                   Rectangle()
                      .mondrianStyle(width: 50, height: 300, color: .blue)
                }
                 .frame(maxWidth: .infinity, maxHeight: 300)
                
               // Row 3
                 HStack {
                    Rectangle()
                      .mondrianStyle(width: 50, height: 40, color: Color.white)
                    Rectangle()
                      .mondrianStyle(width: 180, height: 40, color: Color.white)
                    Rectangle()
                     .mondrianStyle(width: 170, height: 40, color: Color.yellow)
                }
                 .frame(maxWidth: .infinity, maxHeight: 40)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
