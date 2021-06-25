//
//  ItemDetail.swift
//  iDine
//
//  Created by Natasha Godwin on 6/22/21.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isFavorite = false
    @State private var showingConfirmation = false
    @State private var readyToOrder = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable() // adapts to different screen sizes
                    .scaledToFit() // fits in the screen
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Add to Order") {
                order.add(item: item)
                self.showingConfirmation.toggle()
            }
            .frame(width: 290, height: 50)
            .background(Color.red)
            .font(.headline)
            .foregroundColor(.white)
            .cornerRadius(10.0)
            Spacer()
        }
        .navigationBarTitle(item.name, displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
             self.isFavorite.toggle()
            // Add or remove item from favorites
             if isFavorite == true {
                order.addToFavorites(item: item)
             } else {
                order.removeFromFavorites(item: item)
             }
        }) {
            if isFavorite == true {
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star")
                    .font(.title)
                    .foregroundColor(.yellow)
            }
        })
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text("Added!"), message: Text("Are you ready to order?"), primaryButton: .default(Text("Order"), action: {
                // Go to OrderView
                self.readyToOrder.toggle()
            }), secondaryButton: .cancel(Text("Back to Menu"), action: {
                // Go back to the menu
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
        .sheet(isPresented: $readyToOrder) {
            OrderView()
        }
        
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
