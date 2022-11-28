//
//  NewTodoView.swift
//  vlky
//
//  Created by T Krobot on 12/11/22.
//

import SwiftUI

struct NewTodoView: View {
    @State var todoName = ""
    @State var todoDesc = ""
    @State var todoDate = ""
    @Binding var todos: [Todo]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form{
            Section{
                TextField("Task Name", text: $todoName)
                TextField("Due Date", text: $todoDate)
                TextField("Description (Optional)", text: $todoDesc)
                Button{
                    print("hi")
                    todos.append(Todo(title: todoName, description: todoDesc, dueDate: todoDate))
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save todo")
                }
            } header: {
                Text("New Task")
                    .bold()
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(todos: .constant([]))
    }
}
