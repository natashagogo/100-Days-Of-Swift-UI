//
//  PackageManagerExample.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/5/21.
//

import SwiftUI
import SamplePackage

struct PackageManagerExample: View {
	let possibleNumbers = Array(1...60)
	
	var results: String {
		let selected = possibleNumbers.random(7).sorted() // get 7 random numbers, using a method from the library
		let strings = selected.map(String.init) // convert each to a string
		return strings.joined(separator: ", ") // combine those strings into one string
	}
	
    var body: some View {
        Text(results)
    }
}

struct PackageManagerExample_Previews: PreviewProvider {
    static var previews: some View {
        PackageManagerExample()
    }
}
