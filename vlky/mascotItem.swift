//
//  mascotItem.swift
//  vlky
//
//  Created by T Krobot on 18/11/22.
//

import Foundation

struct mascotItem: Identifiable, Codable {
    var mascotName: String
    var mascotImageName: String
    var mascotCost: Int
    var id = UUID()
    
}
