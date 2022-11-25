//
//  progress view.swift
//  vlky
//
//  Created by Lindsey Choo on 16/11/22.
//

import SwiftUI

struct ProgressView: View {
    
    @Binding var numOfCoins: Int
    @Binding var numTaskCompleted: Int
    @Binding var totalTasks: Int
    
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    Text("Hours studied : ")
                    Text("To-Dos completed : \(numTaskCompleted)")
                    Text("Coins received : \(numOfCoins)")
                }
                
                
               
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Text("Todos done")
                            .font(.title)
                            .padding()
                        circular_progress_view(numTaskCompleted: $numTaskCompleted, progress: CGFloat(totalTasks - numTaskCompleted))
                            .frame(width: 250, height: 250)
                            
                        
                        
                        Text("\(todoManager.todoItems.filter { !$0.isCompleted }.count ) undone todos")
                            .padding()
                    }
                    .padding()
                    Spacer()
                    
                }
            }
            .navigationTitle("Study session")
            
            
            
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(numOfCoins: .constant(0), numTaskCompleted: .constant(0), totalTasks: .constant(1), todoManager: TodoManager())
    }
}
