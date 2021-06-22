//
//  ItemRow.swift
//  iDine
//
//  Created by Natasha Godwin on 6/22/21.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    // For dietary restriction labels
    let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green
    ]
    var body: some View {
        HStack(alignment: .top) {
            Image(item.thumbnailImage)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(String("$\(item.price)"))
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: Color.black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
