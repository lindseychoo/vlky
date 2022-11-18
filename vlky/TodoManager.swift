//
//  TodoManager.swift
//  vlky
//
//  Created by T Krobot on 18/11/22.
//

import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    
    @Published var todoItems: [Todo] = [] {
        didSet {
            save()
        }
    }
    
    var undoneTodos: [Todo] {
        todoItems.filter { $0.isCompleted == false}
    }
    
    let sampleTodoItems: [Todo] =  [
        Todo(title: "Walk the cat", description: ""),
        Todo(title: "Complete AAs", description: ""),
        Todo(title: "Fix the cabinet", isCompleted: true, description: "")
    ]
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodoItems = try? propertyListEncoder.encode(todoItems)
        try? encodedTodoItems?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalTodoItems: [Todo]!
        
        if let retrievedTodoItemData = try? Data(contentsOf: archiveURL),
            let decodedTodoItems = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoItemData) {
                finalTodoItems = decodedTodoItems
        } else {
            finalTodoItems = sampleTodoItems
        }
        
        todoItems = finalTodoItems
    
    }
}
