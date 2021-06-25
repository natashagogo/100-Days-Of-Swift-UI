//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [MenuItem]()
    @Published var favorites = [MenuItem]()

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    // TO DO:
    // Reduce code duplication

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func addToFavorites(item: MenuItem) {
        favorites.append(item)
    }
    
    func removeFromFavorites(item: MenuItem) {
        if let index = favorites.firstIndex(of: item) {
            favorites.remove(at: index)
        }
    }
}
