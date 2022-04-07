//
//  WritingData.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI

struct WritingData: View {
	 var body: some View {
		Text("Hello World")
			 .onTapGesture {
				  let str = "Test Message"
				  let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")

				  do {
						try str.write(to: url, atomically: true, encoding: .utf8)
						let input = try String(contentsOf: url)
						print(input)
				  } catch {
						print(error.localizedDescription)
				  }
			 }
	 }
	
	func getDocumentsDirectory() -> URL {
		 // find all possible documents directories for this user
		 let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

		 // just send back the first one, which ought to be the only one
		 return paths[0]
	}
}

struct WritingData_Previews: PreviewProvider {
    static var previews: some View {
        WritingData()
    }
}
