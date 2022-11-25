//
//  StoreView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct StoreView: View {
    
    var decorationItems = [decorationItem(decorationItemName: "Blue Balloon", decorationImageName: "BlueBalloon"), decorationItem(decorationItemName: "Green Balloon", decorationImageName: "GreenBalloon"), decorationItem(decorationItemName: "Yellow Balloon", decorationImageName: "YellowBalloon"), decorationItem(decorationItemName: "Purple Balloon", decorationImageName: "PurpleBalloon"), decorationItem(decorationItemName: "Red Balloon", decorationImageName: "RedBalloon"), decorationItem(decorationItemName: "Bracelet", decorationImageName: "GreenBracelet")]
    var foodItems = [foodItem(foodItemName: "Cupcake", foodImageName: "PinkCupcake"), foodItem(foodItemName: "Chocolate", foodImageName: "Chocolate"), foodItem(foodItemName: "Purple Candy", foodImageName: "PurpleCandy"), foodItem(foodItemName: "Red Candy", foodImageName: "RedCandy"), foodItem(foodItemName: "Yellow Candy", foodImageName: "YellowCandy"), foodItem(foodItemName: "Green Candy", foodImageName: "GreenCandy"), foodItem(foodItemName: "Blue Candy", foodImageName: "BlueCandy"), foodItem(foodItemName: "Blue Lollipop", foodImageName: "BlueLollipop"), foodItem(foodItemName: "Red Lollipop", foodImageName: "RedLollipop"), foodItem(foodItemName: "Cherries", foodImageName: "Cherries"), foodItem(foodItemName: "Avocado", foodImageName: "Avacado"), foodItem(foodItemName: "Grapes", foodImageName: "Grapes"), foodItem(foodItemName: "Apple", foodImageName: "Apple"), foodItem(foodItemName: "Burger", foodImageName: "Burger"), foodItem(foodItemName: "French Fries", foodImageName: "FrenchFries")]
    let columns = [GridItem(.adaptive(minimum: 120))]
    var mascots = [mascotItem(mascotName: "Christmas Valkey", mascotImageName: "christmasValkey"), mascotItem(mascotName: "Valentines Valkey", mascotImageName: "valentinesValkey"), mascotItem(mascotName: "Halloween Valkey", mascotImageName: "halloweenValkey")]
    @Binding var isFeedbackResponseViewPresented: Bool
    @Binding var numOfCoins: Int
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack {
                    Spacer()
                    HStack{
                        Image(systemName: "dollarsign.circle")
                            .font(.title)
                        Text("\(numOfCoins)")
                            .font(.title)
                    }
                    .padding(.horizontal)
                }
                Text("Decorations")
                    .font(.title2)
                    .italic()
                    .bold()
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        Spacer().frame(width: 5)
                        ForEach(decorationItems) { decorationItem in
                            Button {
                                isFeedbackResponseViewPresented = true
                            } label: {
                                VStack {
                                    Image(decorationItem.decorationImageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(decorationItem.decorationItemName)
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                                .padding(20)
                                .background(.cyan)
                                .cornerRadius(10)
                            }
                            .sheet(isPresented: $isFeedbackResponseViewPresented) {
                                FeedbackResponseView(isClicked: true)
                            }
                            
                        }
                    }
                }
                VStack {
                    Text("Food")
                        .font(.title2)
                        .italic()
                        .bold()
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        Spacer().frame(width: 5)
                        ForEach(foodItems) { foodItem in
                            Button {
                                isFeedbackResponseViewPresented = true
                            } label: {
                                VStack {
                                    Image(foodItem.foodImageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(foodItem.foodItemName)
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                                .padding(20)
                                .background(.cyan)
                                .cornerRadius(10)
                            }
                            .sheet(isPresented: $isFeedbackResponseViewPresented) {
                                FeedbackResponseView(isClicked: true)
                            }
                            
                        }
                    }
                }
                VStack {
                    Text("Mascots")
                        .font(.title2)
                        .italic()
                        .bold()
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        Spacer().frame(width: 5)
                        ForEach(mascots) { mascot in
                            Button {
                                isFeedbackResponseViewPresented = true
                            } label: {
                                VStack {
                                    Image(mascot.mascotImageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(mascot.mascotName)
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                                .padding(20)
                                .background(.cyan)
                                .cornerRadius(10)
                            }
                            .sheet(isPresented: $isFeedbackResponseViewPresented) {
                                FeedbackResponseView(isClicked: true)
                            }
                        }
                    }
                }
                .navigationTitle("Store")
            }
        }
        
    }
    
    struct StoreView_Previews: PreviewProvider {
        static var previews: some View {
            StoreView(isFeedbackResponseViewPresented: .constant(false), numOfCoins: .constant(0))
        }
    }
}
