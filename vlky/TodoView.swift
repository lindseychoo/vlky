//
//  TodoView.swift
//  vlky
//
//  Created by T Krobot on 21/11/22.
//

import SwiftUI

struct TodoView: View {
    
    @State var isNewSheetShown = false
    @Binding var numTaskCompleted: Int
    @Binding var totalTasks: Int
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
                                    if todo.isCompleted {
                                        numTaskCompleted += 1
                                    } else {
                                        numTaskCompleted -= 1
                                    }
                                    todoManager.reload.toggle()
                                }
                            VStack (alignment: .leading){
                                Text(todo.title)
                                    .foregroundColor(todo.isCompleted ? .red : .blue )
                                    .strikethrough(todo.isCompleted)
                                Text("Due \(todo.dueDate)")
                                    .font(.system(size: 10))
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    for i in indexSet.makeIterator() {
                        let item = todoManager.todoItems[i]
                        if item.isCompleted {
                            numTaskCompleted -= 1
                        }
                    }
                    todoManager.todoItems.remove(atOffsets: indexSet)
                    totalTasks -= 1
//                    if todo.isCompleted {
//
//                    }

                }
                .onMove { originalOffset, newOffset in
                    todoManager.todoItems.move(fromOffsets: originalOffset, toOffset: newOffset)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        totalTasks += 1
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
        TodoView(numTaskCompleted: .constant(0), totalTasks: .constant(0), todoManager: TodoManager())
    }
}

