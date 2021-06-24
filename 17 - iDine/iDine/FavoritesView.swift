//
//  FavoritesView.swift
//  iDine
//
//  Created by Natasha Godwin on 6/24/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                ForEach(order.favorites) { favorite in
                    ItemRow(item: favorite)
                }
                .onDelete(perform: unfavorite)
            }
            .navigationTitle("Favorites")
        }
    }
    
    func unfavorite(at locations: IndexSet) {
        order.favorites.remove(atOffsets: locations)
    }

}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(Order())
    }
}
