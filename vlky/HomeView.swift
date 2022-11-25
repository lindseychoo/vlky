//
//  HomeView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct HomeView: View {
    
    let encouragements = [
        Encouragement(setup: "", words: "keep going"),
        Encouragement(setup: "", words: "you're doing well"),
        Encouragement(setup: "", words: "good job"),
        Encouragement(setup: "", words: "keep up the good work"),
        Encouragement(setup: "", words: "fly high"),
        Encouragement(setup: "", words: "continue striving")
    ]
    
    @State var showEncouragement = false
    @State var currentEncouragement = 0
    @Binding var numOfCoins: Int
    
    var body: some View {
        ZStack{
            Image("HomeWallpaper")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea([.top, .bottom])
            
            VStack {
                
                HStack {
                    Text("Welcome           ")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Image(systemName: "dollarsign.circle")
                        .font(.title)
                    Text("\(numOfCoins)")
                        .font(.title)
                    
                }
                Image("mascot")
                    .resizable()
                    .scaledToFit()
                    .mask(Circle())
                    .padding()
                
                ZStack {
//                    Color(.systemBackground)
//                        .frame(maxHeight: 200)
//                        .onTapGesture{
//                            if showEncouragement {
//                                currentEncouragement += 1
//                                showEncouragement = false
//                            }
//                        }
                    VStack {
                        Text(encouragements[currentEncouragement % encouragements.count].setup)
                        
                        Button {
                            showEncouragement = true
                            currentEncouragement += 1
                        } label: {
                            Text (" Valkey ")
                                .font(.system(size: 35))
                                .padding()
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        .padding()
                        
//                        if showEncouragement {
                        Text(showEncouragement ? encouragements [currentEncouragement % encouragements.count].words : "")
                            .font(.system(size: 25))
                                .padding()
//                        }
                        
                    }
                }
            }
        }
        
        
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(numOfCoins: .constant(1))
    }
}
