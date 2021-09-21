//
//  ContentView.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI

/*
Does your class need to conform to UIViewControllerRepresentable, when using MapKit in a SwiftUI application?
No. MapKit's underlying type is MKMapView, which is a view, not a controller, so you can't use UIViewControllerRepresentable.
Use UIViewRepresentable instead.

What does a class need to conform to UIViewRepresentable?
Like UIViewControllerRepresentable, it needs two methods:
1. makeUIView()
2. updateUIView()

However, unlike UIViewControllerRepresentable, the update method needs to be implemented.
updateUIView() is more important for views than view controllers. 

What is MVC?
MVC is an approach to building software that divides code into three types:
1. Model (data)
2. View (layouts)
3. Controller (code that connects the model with views)

Does Apple use MVC in frameworks like UIKit and MapKit?
Yes, but it added view controllers, which created a lot of confusion
because it's not clear whether they are supposed to be views, controllers, both, or neither.

What's one way to think about the difference between a view and a view controller?
A view is one piece of layout, e.g. a button, whereas a view controller is one, self-contained screen of content.


What does every coordinator class need?
Every coordinator class should ...
1. Inherit from NSObject
2. Inherit from whatever delegate protocol the view or view controller works with
3. Reference a parent struct, so it can pass data to and from SwiftUI

Note that in order to use the coordinator class, you need to write a method called makeCoordinator() in the main struct.

What does MapKit use to display annotations?
The class MKPointAnnotation, which conforms to the MKAnnotation protocol. 


*/


struct ContentView: View {
    var body: some View {
		MapViewExample()
			 .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
