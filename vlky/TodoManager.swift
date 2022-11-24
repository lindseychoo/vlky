//
//  TodoManager.swift
//  vlky
//
//  Created by T Krobot on 18/11/22.
//

import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    @Published var numTaskCompleted: [TodoView] = []{
        didSet {
            save()
        }
    }
    @Published var todoItems: [Todo] = [] {
        didSet {
            save()
        }
    }
    
    var undoneTodos: [Todo] {
        todoItems.filter { $0.isCompleted == false}
    }
    
    let sampleTodoItems: [Todo] =  [
        Todo(title: "Add your first todo!", description: "Click on the Plus Sign on the top right hand corner of the screen to add a new todo", dueDate: "As soon as possible!")
        
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
