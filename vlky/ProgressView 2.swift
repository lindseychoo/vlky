//
//  progress view.swift
//  vlky
//
//  Created by Lindsey Choo on 16/11/22.
//

import SwiftUI

struct ProgressView: View {
    @State var progress: Int = 0
    @Binding var numOfCoins: Int
    @Binding var numTaskCompleted: Int
    
    var body: some View {
        NavigationView{
            List{
                
                Text("Hours studied : ")
                Text("To-Dos completed : \(numTaskCompleted)")
                Text("Coins received : \(numOfCoins)")
                
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

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
       ProgressView(numOfCoins: .constant(0), numTaskCompleted: .constant(0))
    }
}
