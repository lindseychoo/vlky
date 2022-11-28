//
//  TodoDetailView.swift
//  vlky
//
//  Created by T Krobot on 12/11/22.
//

import SwiftUI

struct TodoDetailView: View {
    @Binding var numTaskCompleted: Int
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            TextField("Title of todo", text: $todo.title)
            TextField("Due Date", text: $todo.dueDate)
            TextField("Notes (Optional)", text: $todo.description)
            
            //how to we make the notes text field larger? or is the only way to make a new expanded sheet
            
            Section {
                Button{
                    todo.isCompleted.toggle()
                    if todo.isCompleted {
                        numTaskCompleted += 1
                    } else {
                        numTaskCompleted -= 1
                    }
                } label: {
                    Text(todo.isCompleted ? "Mark Incomplete" : "Mark as done")
                        .foregroundColor(todo.isCompleted ? .red : .blue)
                }
            }
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(numTaskCompleted: .constant(0), todo: .constant(Todo(title: "", description: "", dueDate: "")))
    }
}


//todo.isCompleted.toggle()
