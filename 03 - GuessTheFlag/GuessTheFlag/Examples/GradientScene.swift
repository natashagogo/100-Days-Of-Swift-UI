//
//  GradientScene.swift
//  GuessTheFlag
//
//  Created by Natasha Godwin on 4/12/22.
//

import SwiftUI

struct GradientScene: View {
	var body: some View {
		ZStack {
			RadialGradient(
			  gradient: Gradient(colors: [.white, .yellow, .orange, .red, .pink]),
			  center: .center,
			  startRadius: 20,
			  endRadius: 200
			)
			HStack {
				ForEach(0..<50) { _ in
					AngularGradient(gradient: Gradient(colors: [.white, .blue, .white, .blue, .white, .blue, .blue, .blue, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .white, .blue, .blue, .white, .blue, .white, .blue, .white]), center: .center)
						.clipShape(Circle())
						.frame(width: CGFloat(Int.random(in: 20...50)), height: CGFloat(Int.random(in: 20...50)))
						.offset(y: CGFloat(Int.random(in: 20...300)))
				}
			}
			.frame(width: 350, height: 500)
		}.ignoresSafeArea()
	}
}

struct GradientScene_Previews: PreviewProvider {
    static var previews: some View {
        GradientScene()
    }
}
