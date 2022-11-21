//
//  progress view.swift
//  vlky
//
//  Created by Lindsey Choo on 16/11/22.
//

import SwiftUI

struct progress_view: View {
    @State var progress: Int = 0
    
    var body: some View {
        NavigationView{
            List{
                
                Text("Hours studied : ")
                Text("To-Dos completed : \(numTaskCompleted)")
                Text("coins received : \(numOfCoins)")
                
                
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Text("Todos done")
                            .font(.title)
                        circular_progress_view(progress: progress)
                            .frame(width: 150, height: 150)
                    }
                    .padding()
                    Spacer()
                }
                
            }
            .navigationTitle("Study session")
            
            
            
        }
    }
}

struct progress_view_Previews: PreviewProvider {
    static var previews: some View {
        progress_view()
    }
}
