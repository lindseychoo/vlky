//
//  Todo.swift
//  vlky
//
//  Created by T Krobot on 12/11/22.
//

import Foundation

struct Todo: Identifiable{
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var description: String
}
