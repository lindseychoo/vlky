//
//  storeItem.swift
//  vlky
//
//  Created by T Krobot on 27/11/22.
//

import Foundation

struct StoreItem: Codable {
    var foodItem: [foodItem]
    var decoItem: [decorationItem]
    var mascotItem: [mascotItem]
}
