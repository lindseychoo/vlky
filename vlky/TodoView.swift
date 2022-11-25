//
//  TodoView.swift
//  vlky
//
//  Created by T Krobot on 21/11/22.
//

import SwiftUI

struct TodoView: View {
    
    @State var isNewSheetShown = false
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach($todoManager.todoItems) { $todo in
                    NavigationLink {
                        TodoDetailView(numTaskCompleted: .constant(0), todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            Text(todo.title)
                                .foregroundColor(todo.isCompleted ? .red : .blue )
                                .strikethrough(todo.isCompleted)
                        }
                    }
                }
                .onDelete { indexSet in
                    todoManager.todoItems.remove(atOffsets: indexSet)
                }
                .onMove { originalOffset, newOffset in
                    todoManager.todoItems.move(fromOffsets: originalOffset, toOffset: newOffset)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isNewSheetShown = true
                    } label : {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isNewSheetShown) {
                NewTodoView(todos: $todoManager.todoItems)
            }
        }
    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(todoManager: TodoManager())
    }
}

