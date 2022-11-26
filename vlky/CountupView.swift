import SwiftUI
 
struct CountupView: View {
   
   @Binding var numOfCoins: Int
   
   @Binding var hours: Int
   @Binding var minutes: Int
   @Binding var seconds: Int
    @State var currentHour: Int = 0
    @State var currentMin: Int = 0
    @State var currentSec: Int = 0
   @State var timerIsPaused: Bool = true
   
   @State var timer: Timer? = nil
   
   var body: some View {
       NavigationView{
           ZStack{
               ZStack {
                   if currentHour % 2 == 0 {
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
 
                   Text("\(currentHour):\(currentMin):\(currentSec)")
                       .font(.largeTitle)
                       .bold()
                       .padding(.top)
                   
                   Image("mascot")
                       .resizable()
                       .mask(Circle())
                       .scaledToFit()
                       .frame(width:400, height:400)
                   
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
                           .padding(.bottom, 100)
                           .padding(.horizontal)
                         
                           
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
                           .padding(.bottom, 100)
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
                       .padding(.bottom, 100)
                       .padding(.horizontal)
                       
                   }
               }
               .onChange(of: currentMin) { _ in
                   if Int(currentMin) % 10 == 0 {
                       numOfCoins += 1
                       
                   }
               }
               .toolbar {
                   
                   ToolbarItem(placement: .navigationBarLeading) {
                       Text("Stop Watch")
                           .font(.largeTitle.bold())
                           .padding(.top)
                   }
                   
               
                   
                   ToolbarItem(placement: .navigationBarTrailing) {
                       HStack{
                           Image(systemName: "dollarsign.circle")
                               .font(.title)
                           Text("\(numOfCoins)")
                               .font(.title)
                           
                       }
                       .padding(.top)
                   }
               }
 
           }
       }
   }
   
   func startTimer(){
       timerIsPaused = false
       timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
           if self.currentSec == 59 {
               self.currentSec = 0
               if self.currentMin == 59 {
                   self.currentMin = 0
                   self.currentHour = self.currentHour + 1
               } else {
                   self.currentMin = self.currentMin + 1
               }
           } else {
               self.currentSec = self.currentSec + 1
           }
       }
   }
   
   func stopTimer(){
       timerIsPaused = true
       timer?.invalidate()
       timer = nil
   }
   
   func restartTimer(){
       hours += currentHour
       minutes += currentMin
       seconds += currentSec
       
       if seconds >= 60 {
           seconds -= 60
           minutes += 1
       }
       
       if minutes >= 60 {
           minutes -= 60
           hours += 1
       }
       
       currentHour = 0
       currentMin = 0
       currentSec = 0
   }
}
 
 
 
struct CountupView_Previews: PreviewProvider {
    
    struct bindingholder: View {
        @State var hours = 0
        @State var minutes = 0
        @State var seconds = 0
        var body: some View {
            CountupView(numOfCoins: .constant(0), hours: $hours, minutes: $minutes, seconds: $seconds)
 
        }
        
    }
    
   static var previews: some View {
       bindingholder()
//       CountupView(numOfCoins: .constant(0), hours: .constant(0), minutes: .constant(0), seconds: .constant(0))
   }
}

