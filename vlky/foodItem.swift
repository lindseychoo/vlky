//
//  storeItem.swift
//  vlky
//
//  Created by T Krobot on 12/11/22.
//

import Foundation

struct foodItem: Identifiable {
    var foodItemName: String
    var foodImageName: String
    var foodPrice: Int
    var id = UUID()
    
}
