import SwiftUI
 
struct HomeView: View {
    
    let encouragements = [
        Encouragement(setup: "", words: "Tough times don’t last."),
        Encouragement(setup: "", words: "You are doing well!"),
        Encouragement(setup: "", words: "Great job!"),
        Encouragement(setup: "", words: "Keep up the good work!"),
        Encouragement(setup: "", words: "Fly high!"),
        Encouragement(setup: "", words: "Continue striving."),
        Encouragement(setup: "", words: "The road to excellence is near."),
        Encouragement(setup: "", words: "Keep going!"),
        Encouragement(setup: "", words: "You can."),
        Encouragement(setup: "", words: "Be yourself."),
        Encouragement(setup: "", words: "Take a break!"),
        Encouragement(setup: "", words: "Believe in youself"),
        Encouragement(setup: "", words: "Dream big!"),
        Encouragement(setup: "", words: "Work for it."),
        Encouragement(setup: "", words: "The sky's the limit."),
        Encouragement(setup: "", words: "Practice makes perfect!"),
        Encouragement(setup: "", words: "Reach for the stars."),
        Encouragement(setup: "", words: "You can and you will."),
        Encouragement(setup: "", words: "Own who you are!"),
        Encouragement(setup: "", words: "Commit to your dream!"),
        Encouragement(setup: "", words: "You can do it."),
        Encouragement(setup: "", words: "You are enough."),
        Encouragement(setup: "", words: "Learn from your mistakes!"),
        Encouragement(setup: "", words: "Grow."),
        Encouragement(setup: "", words: "What's stopping you?"),
        Encouragement(setup: "", words: "It is never too late."),
        Encouragement(setup: "", words: "One day at a time."),
        Encouragement(setup: "", words: "Don't quit!"),
        Encouragement(setup: "", words: "Keep at it!"),
        Encouragement(setup: "", words: "Progress is better than perfection.")
    ]
    
    @State var showEncouragement = false
    @State var currentEncouragement = 0
    @Binding var numOfCoins: Int
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("HomeWallpaper")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea([.top, .bottom])
                    .opacity(0.7)
                
                VStack {
                    HStack {
                        Spacer()
                        HStack{
                            Image(systemName: "dollarsign.circle")
                                .font(.title)
                            Text("\(numOfCoins)")
                                .font(.title)
                        }
                        .padding(.horizontal)
                        .padding(.horizontal)
                      
                    }
                    Image("mascot")
                        .resizable()
                        .scaledToFit()
                        .mask(Circle())
                        .padding(.top)
                        .padding()
                    
                    ZStack {
                        VStack {
                            Text(encouragements[currentEncouragement % encouragements.count].setup)
                            
                            Button {
                                showEncouragement = true
                                currentEncouragement += 1
                            } label: {
                                Text (" Valkey ")
                                    .font(.title)
                                    .padding()
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
                            Text(showEncouragement ? encouragements [currentEncouragement % encouragements.count].words : "")
                                .font(.title2)
                                .italic()
                                .padding()
                            
                        }
                    }
                }
            }
            .navigationTitle("Welcome")
        }
        
        
    }
}
 
 
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(numOfCoins: .constant(1))
    }
}
