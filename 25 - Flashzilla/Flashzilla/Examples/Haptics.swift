//
//  Haptics.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//

import SwiftUI
import CoreHaptics

struct Haptics: View {
	@State private var engine: CHHapticEngine?
    var body: some View {
        Text("Do you feel me?")
			.font(.largeTitle)
			.onAppear(perform: prepareHaptics)
			.onTapGesture(perform: complexSuccess)
    }
	
	
	func simpleHaptics() {
		let generator = UINotificationFeedbackGenerator()
		var result: UINotificationFeedbackGenerator.FeedbackType = .success
		
		switch result {
		case .success:
			generator.notificationOccurred(.success)
			print("Success")
		case .warning:
			generator.notificationOccurred(.warning)
			print("Warning")
		case .error:
			generator.notificationOccurred(.error)
			print("Error")
		@unknown default:
			fatalError()
		}
	}
	
	func prepareHaptics() {
		// If the device has haptics, run the method; otherwise, exit
		 guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

		 do {
			  self.engine = try CHHapticEngine()
			  try engine?.start()
		 } catch {
			  print("There was an error creating the engine: \(error.localizedDescription)")
		 }
	}
	
	func complexSuccess() {
		 // make sure that the device supports haptics
		 guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
		 var events = [CHHapticEvent]()

		 // create one intense, sharp tap
		 let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
		 let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
		 let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
		 events.append(event)

		 // convert those events into a pattern and play it immediately
		 do {
			  let pattern = try CHHapticPattern(events: events, parameters: [])
			  let player = try engine?.makePlayer(with: pattern)
			  try player?.start(atTime: 0)
		 } catch {
			  print("Failed to play pattern: \(error.localizedDescription).")
		 }
	}
}

struct Haptics_Previews: PreviewProvider {
    static var previews: some View {
        Haptics()
    }
}
