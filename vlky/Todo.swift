//
//  Todo.swift
//  vlky
//
//  Created by T Krobot on 12/11/22.
//

import Foundation

struct Todo: Identifiable, Codable{
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    var description: String
//    var isDone = true
}
