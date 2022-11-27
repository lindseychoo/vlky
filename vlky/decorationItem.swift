//
//  decorationItem.swift
//  vlky
//
//  Created by T Krobot on 25/11/22.
//

import Foundation

struct decorationItem: Identifiable, Codable {
    var decorationItemName: String
    var decorationImageName: String
    var price: Int
    var id = UUID()
    
}
