import SwiftUI
import HalfASheet

struct StoreView: View {
    
    var decorationItems = [decorationItem(decorationItemName: "Blue Balloon", decorationImageName: "BlueBalloon", price: 25), decorationItem(decorationItemName: "Green Balloon", decorationImageName: "GreenBalloon", price: 25), decorationItem(decorationItemName: "Yellow Balloon", decorationImageName: "YellowBalloon", price: 25), decorationItem(decorationItemName: "Purple Balloon", decorationImageName: "PurpleBalloon", price: 25), decorationItem(decorationItemName: "Red Balloon", decorationImageName: "RedBalloon", price: 25), decorationItem(decorationItemName: "Bracelet", decorationImageName: "GreenBracelet", price: 25)]
    
    var foodItems = [foodItem(foodItemName: "Cupcake", foodImageName: "PinkCupcake", foodPrice: 50), foodItem(foodItemName: "Chocolate", foodImageName: "Chocolate", foodPrice: 50), foodItem(foodItemName: "Purple Candy", foodImageName: "PurpleCandy", foodPrice: 50), foodItem(foodItemName: "Red Candy", foodImageName: "RedCandy", foodPrice: 50), foodItem(foodItemName: "Yellow Candy", foodImageName: "YellowCandy", foodPrice: 50), foodItem(foodItemName: "Green Candy", foodImageName: "GreenCandy", foodPrice: 50), foodItem(foodItemName: "Blue Candy", foodImageName: "BlueCandy", foodPrice: 50), foodItem(foodItemName: "Blue Lollipop", foodImageName: "BlueLollipop", foodPrice: 50), foodItem(foodItemName: "Red Lollipop", foodImageName: "RedLollipop", foodPrice: 50), foodItem(foodItemName: "Cherries", foodImageName: "Cherries", foodPrice: 50), foodItem(foodItemName: "Avocado", foodImageName: "Avacado", foodPrice: 50), foodItem(foodItemName: "Grapes", foodImageName: "Grapes", foodPrice: 50), foodItem(foodItemName: "Apple", foodImageName: "Apple", foodPrice: 50), foodItem(foodItemName: "Burger", foodImageName: "Burger", foodPrice: 50), foodItem(foodItemName: "French Fries", foodImageName: "FrenchFries", foodPrice: 50)]
    
    let columns = [GridItem(.adaptive(minimum: 120))]
    var mascots = [mascotItem(mascotName: "Christmas Valkey", mascotImageName: "christmasValkey", mascotCost: 200), mascotItem(mascotName: "Valentines Valkey", mascotImageName: "valentinesValkey", mascotCost: 200), mascotItem(mascotName: "Halloween Valkey", mascotImageName: "halloweenValkey", mascotCost: 200)]
    

    @Binding var numOfCoins: Int
    @State private var isShowing = false
    
    @State var selectedDeco: decorationItem = decorationItem(decorationItemName: "", decorationImageName: "", price: 0)
    @State var selectedMascot: mascotItem = mascotItem(mascotName: "", mascotImageName: "", mascotCost: 0)

    @State var selectedFood: foodItem = foodItem(foodItemName: "", foodImageName: "", foodPrice: 0)
    @State var selectedtype: String = ""
    
    
    var body: some View {
        ZStack{
            NavigationView {
                
                VStack{
                    Text("Decorations")
                        .font(.title2)
                        .fontWeight(.semibold)
                    //                }
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            Spacer().frame(width: 5)
                            ForEach(decorationItems) { decorationItem in
                                Button {
                                    isShowing.toggle()

                                    selectedDeco = decorationItem
                                    selectedtype = "decor"
                                } label: {
                                    VStack {
                                        Image(decorationItem.decorationImageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(decorationItem.decorationItemName)
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.medium)
                                    }
                                    .padding(20)
                                    .background(.cyan)
                                    .cornerRadius(10)
                                }
                                
                                
                            }
                        }
                    }
                    //                VStack {
                    Text("Food")
                        .font(.title2)
                        .fontWeight(.semibold)
                    //                }
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            Spacer().frame(width: 5)
                            ForEach(foodItems) { foodItem in
                                Button {
                                    isShowing.toggle()
                                    selectedFood = foodItem
                                    selectedtype = "food"
                                } label: {
                                    VStack {
                                        Image(foodItem.foodImageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(foodItem.foodItemName)
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.medium)
                                    }
                                    .padding(20)
                                    .background(.cyan)
                                    .cornerRadius(10)
                                }
                                
                                
                            }
                        }
                    }
                    //                VStack {
                    Text("Mascot Costumes")
                        .font(.title2)
                        .fontWeight(.semibold)
                    //                }
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            Spacer().frame(width: 5)
                            ForEach(mascots) { mascot in
                                Button {
                                    isShowing.toggle()
                                    selectedMascot = mascot
                                    selectedtype = "mascot"
                                } label: {
                                    VStack {
                                        Image(mascot.mascotImageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(mascot.mascotName)
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.medium)
                                    }
                                    .padding(20)
                                    .background(.cyan)
                                    .cornerRadius(10)
                                }
                                //                                .sheet(isPresented: $isFeedbackResponseViewPresented) {
                                //                                    FeedbackResponseView(isClicked: true, numOfCoins: $numOfCoins)
                                //                                }
                                
                            }
                        }
                        //                    .navigationTitle("Store")
                        
                    }
                    
                    
                    
                }
                
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Store")
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
            HalfASheet(isPresented: $isShowing) {
                VStack{
                    if selectedtype == "decor" {
                        Text(selectedDeco.decorationItemName)
                            .font(.largeTitle)
                            .bold()
                        Image(selectedDeco.decorationImageName)
                            .resizable()
                            .scaledToFit()
                    }
                    if selectedtype == "food" {
                        Text(selectedFood.foodItemName)
                            .font(.largeTitle)
                            .bold()
                        Image(selectedFood.foodImageName)
                            .resizable()
                            .scaledToFit()
                        
                    }
                    if selectedtype == "mascot" {
                        Text(selectedMascot.mascotName)
                            .font(.largeTitle)
                            .bold()
                        Image(selectedMascot.mascotImageName)
                            .resizable()
                            .scaledToFit()
                        
                    }
                    
                    Button{
                        if selectedtype == "decor" {
                            numOfCoins -= selectedDeco.price
                        }

                        if selectedtype == "food" {
                            numOfCoins -= selectedFood.foodPrice
                        }

                        if selectedtype == "mascot" {
                            numOfCoins -= selectedMascot.mascotCost
                        }

                        
                    } label: {
                        Text("Buy")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                    }
                    
                }
            }
        }
        
        
    
   
    }
}
    
    struct StoreView_Previews: PreviewProvider {
        static var previews: some View {
            StoreView(numOfCoins: .constant(0))
        }
    }

