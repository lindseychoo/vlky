//
//  TodoView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct TodoView: View {
    @State var todos = [Todo(title: "Bring Teddy Home", description: ""), Todo(title: "Complete AAs", description: "Cries"), Todo(title: "Learn cell models", description: "")]
    
    @Binding var numOfCoins: Int
    @State var progress: Int = 0
    @State var isSheetPresented = false
    @State var numTaskCompleted = 0
    @State var sheetShown = false
    
    var body: some View {
        
        circular_progress_view(progress: progress)
                      .frame(width: 150, height: 150)
     
        NavigationView {
            List{
                Text("Completed: \(numTaskCompleted)")
                    .bold()
                Text("Coins received: \(numOfCoins)")
                ForEach($todos) { $todo in
                    // foreach allows deleting
                    NavigationLink{
                        TodoDetailView(numTaskCompleted: $numTaskCompleted, todo: $todo)
                    } label: {
                        VStack{
                            HStack{
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                                    .foregroundColor(todo.isCompleted ? .red : .blue)
                            }
                            Text(todo.description)
                                .font(.system(size: 15))
                                .italic()
                                .foregroundColor(.gray)
                            
                        }
                        
                    }
                    
                }
                .onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                    //allows task to be deleted when swiped
                }
                .onMove { indices, newOffset in
                    todos.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .overlay (Group{
                Text(todos.isEmpty ? "You have no todos!" : "")
                    .italic()
                    .font(.title2)
                    .foregroundColor(.gray)
            })
            .navigationTitle("Todo List")
            .toolbar{
                ToolbarItemGroup (placement: .navigationBarTrailing){
                    EditButton()
                    Button{
                        isSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
                
            }
            .sheet(isPresented: $isSheetPresented) {
                NewTodoView(todos: $todos)
            }
            .onChange(of: numTaskCompleted) { _ in
                if numTaskCompleted == todos.count {
                    numOfCoins += 1
                    print(numOfCoins)
                }
                   
                    
            }
            
        }
         
        
    }
}
struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(numOfCoins: .constant(0))
    }
}
