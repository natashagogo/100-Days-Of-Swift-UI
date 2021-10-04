//
//  ContentView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

/*

If there is one sign that a programming resource is going to be worth my time, it's the phrase "It isn't magic".

Can-Dos

Q&A

What is Result?
A special data type that is used to handle errors.

It contains two pieces of information:
1. The type of result (success or failure)
2. The result itself

Behind the scenes, Result is actually an enum with an associated value (of type String). You can use this to print messages that give more information about the type of error that occurred.

If you pass a closure into a function, what do you need to do?
Tell Swift whether it should be used now or later. Note that the default is now.

When should you use @escaping?
This keyword must be placed before closure parameters in a function. It makes sure the closure can still run, even if the method has returned something and no longer exists in memory.


*/


struct ContentView: View {
    var body: some View {
        ResultExample()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
