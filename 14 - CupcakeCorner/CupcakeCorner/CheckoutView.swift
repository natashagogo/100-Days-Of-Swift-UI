//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/29/21.
//

import SwiftUI

struct CheckoutView: View {
	@ObservedObject var order: Order
	@State private var alertTitle = ""
	@State private var alertMessage = ""
	@State private var showingAlert = false
    var body: some View {
		GeometryReader { geometry in
			 ScrollView {
				  VStack {
					  Image(decorative: "cupcakes")
							 .resizable()
							 .scaledToFit()
							 .frame(width: geometry.size.width)

						Text("Your total is $\(self.order.cost, specifier: "%.2f")")
							 .font(.title)

						Button("Place Order") {
							self.placeOrder()
						}
						.padding()
				  }
			 }
		}
		.navigationBarTitle("Check out", displayMode: .inline)
		.alert(isPresented: $showingAlert) {
			Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
		}
    }
	
	// Send and receive orders over the Internet
	func placeOrder() {
		// Convert order object to JSON, so it can be sent to a server
		guard let encoded = try? JSONEncoder().encode(order) else {
			print("Failed to encode order")
			return
		}
		// Create the URL, wrap it in a URLRequest, and prepare the request to be sent as JSON
		let url = URL(string: "https://reqres.in/api/cupcakes")!
		var request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		// Specify how the data should be sent
		request.httpMethod = "POST"
		request.httpBody = encoded
		
		// Run the request and process the response
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data else {
				print("No data in response: \(error?.localizedDescription ?? "Unknown")")
				return
			}
			
			if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
				showingAlert = true
				alertTitle = "Thank you!"
				alertMessage = "Your order for \(decodedOrder.quantity) \(Order.cupcakes[decodedOrder.selection].lowercased()) cupcakes is on its way!"
			} else {
				// Challenge 2 - If placeOrder() fails, show an informative alert for the user. 
				showingAlert = true
				alertTitle = "Oops!"
				alertMessage = "Something went wrong. Please contact us at hello@cupcakecorner.com."
				print("Invalid response from the server.")
			}
		}.resume()
	}
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
		CheckoutView(order: Order())
    }
}
