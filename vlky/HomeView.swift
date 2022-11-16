//
//  HomeView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct HomeView: View {
    
    let encouragements = [
        Encouragement(setup: "", words: "keep going"), Encouragement(setup: "", words: "you're doing well"),
        Encouragement(setup: "", words: "good job")
    ]
    
    @State var showEncouragement = false
    @State var currentEncouragement = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Welcome")
                    .font(.system(size: 35))
                    .padding()
                Image(systemName: "dollarsign.circle")
                    .font(.system(size: 35))
                Text("\(numOfCoins)")
                    .font(.system(size: 35))
                
            }
            Image("mascot")
                .resizable()
                .scaledToFit()
                .mask(Circle())
                .padding()
       
            ZStack {
                Color(.systemBackground)
                    .frame(maxHeight: 200)
                .onTapGesture{
                    if showEncouragement {
                        currentEncouragement += 1
                        showEncouragement = false
                    }
                }
                VStack {
                    Text(encouragements[currentEncouragement % encouragements.count].setup)
                    
                    Button {
                        showEncouragement = true
                    } label: {
                        Text (" Valkey ")
                            .font(.system(size: 35))
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .padding()
                    
                    if showEncouragement {
                        Text(encouragements [currentEncouragement % encouragements.count].words)
                            .padding()
                    }
                    
                }
            }
            }
           
            
        }
        }
        

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
