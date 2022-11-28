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
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    @StateObject var todoManager: TodoManager
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    Text("Hours studied : \(hours)h \(minutes)min \(seconds)s")
                    Text("Balance : \(numOfCoins) coins")
                    Text("Total Todos: \(totalTasks)")
                }
                
                
               
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Text("Todos done")
                            .font(.title)
                            .padding()
                        circular_progress_view(numTaskCompleted: $numTaskCompleted, progress: CGFloat(totalTasks == 0 ? 1.0 : Float(numTaskCompleted) / Float(totalTasks)))
                            .frame(width: 250, height: 250)
                        
                        Text("\(totalTasks-numTaskCompleted) undone todos")
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
        ProgressView(numOfCoins: .constant(0), numTaskCompleted: .constant(0), totalTasks: .constant(5), hours: .constant(0), minutes: .constant(0), seconds: .constant(0),todoManager: TodoManager())
    }
}
