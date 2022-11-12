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
        VStack{
            
            TextField("Placeholder", text: $todo.title)
                .multilineTextAlignment(.center)
                .padding()
            TextField("Description", text: $todo.description)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                todo.isCompleted.toggle()
                if todo.isCompleted {
                    numTaskCompleted += 1
                } else {
                    numTaskCompleted -= 1
                }
            } label: {
                
                Text(todo.isCompleted ? "Mark as Incomplete" : "Mark as complete")
                    .foregroundColor(.white)
                    .padding()
                    .background(.mint)
                    .cornerRadius(10)
            }
            Text(todo.isCompleted ? "Task done" : "Task not done")
                .foregroundColor(todo.isCompleted ? .blue : .red)
            
        }
        .navigationTitle(todo.title)
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(numTaskCompleted: .constant(0), todo: .constant(Todo(title: "Water teddy", description: "To be done by today")))
    }
}
