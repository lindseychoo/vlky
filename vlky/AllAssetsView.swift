//
//  AllAssetsView.swift
//  vlky
//
//  Created by Kaitlyn Tay on 27/11/22.
//

import SwiftUI

struct AllAssetsView: View {
    
    @ObservedObject var storeManager: StoreManager
    
    //storeManager.storeItem.decoItem
    
    var body: some View {
            VStack {
                VStack {
                    Text("Decorations")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                VStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            Spacer().frame(width: 5)
                            ForEach(storeManager.storeItem.decoItem) { decorationItem in
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
                VStack {
                    Text("Food")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                VStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            Spacer().frame(width: 5)
                            ForEach(storeManager.storeItem.foodItem) { foodItem in
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
                    VStack {
                        Text("Mascot Items")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    VStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                Spacer().frame(width: 5)
                                ForEach(storeManager.storeItem.mascotItem) { mascotItem in
                                    VStack {
                                        Image(mascotItem.mascotImageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(mascotItem.mascotName)
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
                }
            }
        }
    }
struct AllAssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AllAssetsView(storeManager: StoreManager())
    }
}
