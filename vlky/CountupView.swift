//
//  CountupView.swift
//  vlky
//
//  Created by rgs on 25/11/22.
//

import SwiftUI

struct CountupView: View {
   
   @Binding var numOfCoins: Int
   
   @State var hours: Int = 0
   @State var minutes: Int = 0
   @State var seconds: Int = 0
   @State var timerIsPaused: Bool = true
   
   @State var timer: Timer? = nil
   
   var body: some View {
       NavigationView{
           ZStack{
               ZStack {
                   if hours % 2 == 0 {
                       Image("TimerfirstWallpaper")
                           .resizable()
                           .scaledToFit()
                           .aspectRatio(contentMode: .fill)
                           .edgesIgnoringSafeArea(.all)
                           .opacity(0.7)
                   } else {
                       Image("TimerSecondWallpaper")
                           .resizable()
                           .scaledToFit()
                           .aspectRatio(contentMode: .fill)
                           .edgesIgnoringSafeArea(.all)
                           .opacity(0.7)
                   }
               }
               .clipped()
               .edgesIgnoringSafeArea(.all)
               
               VStack {
//                    HStack{
//                        Text("Stop Watch       ")
//                            .font(.largeTitle)
//                            .bold()
//                            .padding()
//                        Image(systemName: "dollarsign.circle")
//                            .font(.title)
//                        Text("\(numOfCoins)")
//                            .font(.title)
//                    }
                   
                   Text("\(hours):\(minutes):\(seconds)")
                       .font(.largeTitle)
                       .bold()
                       .padding()
                   
                   Image("mascot")
                       .resizable()
                       .mask(Circle())
                       .scaledToFit()
                       .padding()
                   
                   if timerIsPaused {
                       
                       HStack {
                           Button(action:{
                               self.restartTimer()
                           }){
                               Image(systemName: "stop.fill")
                                   .foregroundColor(.white)
                                   .font(.title)
                                   .padding()
                                   .background(Color.red)
                                   .cornerRadius(100)
                           }
                           .padding(.all)
                           
                           Button(action:{
                               self.startTimer()
                           }){
                               Image(systemName: "play.fill")
                                   .foregroundColor(.white)
                                   .font(.title)
                                   .padding()
                                   .background(Color.blue)
                                   .cornerRadius(100)
                           }
                           .padding(.all)
                       }
                   } else {
                       Button(action:{
                           self.stopTimer()
                       }){
                           Image(systemName: "pause.fill")
                               .foregroundColor(.white)
                               .font(.title)
                               .padding()
                               .background(Color.orange)
                               .cornerRadius(100)
                       }
                       .padding(.all)
                   }
               }
               .onChange(of: seconds) { _ in
                   if Int(minutes) % 10 == 0 {
                       numOfCoins += 1
                       
                   }
               }
               .navigationTitle("Stop Watch")
               .padding(.all)
           }
       }
   }
   
   func startTimer(){
       timerIsPaused = false
       timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
           if self.seconds == 59 {
               self.seconds = 0
               if self.minutes == 59 {
                   self.minutes = 0
                   self.hours = self.hours + 1
               } else {
                   self.minutes = self.minutes + 1
               }
           } else {
               self.seconds = self.seconds + 1
           }
       }
   }
   
   func stopTimer(){
       timerIsPaused = true
       timer?.invalidate()
       timer = nil
   }
   
   func restartTimer(){
       hours = 0
       minutes = 0
       seconds = 0
   }
}

struct CountupView_Previews: PreviewProvider {
   static var previews: some View {
       CountupView(numOfCoins: .constant(0))
   }
}
