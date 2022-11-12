//
//  StoreView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct StoreView: View {
    
    var items = [storeItem(itemName: "Chest 1", imageName: ""), storeItem(itemName: "Chest 2", imageName: "")]
    let columns = [GridItem(.adaptive(minimum: 100))]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(items) { item in
                Text(item.itemName)
                    .font(.system(size: 30))
                    .padding(20)
                    .background(.cyan)
                    .cornerRadius(10)
                Image(item.imageName)
            }
        }
        .padding()
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}

