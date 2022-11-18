//
//  StoreView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct StoreView: View {
    
    var items = [storeItem(itemName: "Chest 1", imageName: "chest1"), storeItem(itemName: "Chest 2", imageName: "chest2"), storeItem(itemName: "Chest 3", imageName: "chest3"), storeItem(itemName: "Chest 4", imageName: "chest4")]
    let columns = [GridItem(.adaptive(minimum: 120))]
    
    var body: some View {
       
        NavigationView {
            VStack{
                Text("Chests")
                    .font(.title)
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(items) { item in
                            Button {
                            
                            } label: {
                                VStack {
                                    Image(item.imageName)
                                    Text(item.itemName)
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                                .padding(20)
                                .background(.cyan)
                                .cornerRadius(10)
                            }
                        }
                    }
                    //.padding()
                }
            }.navigationTitle("Store")
            
        }
    }
    
}
        
        struct StoreView_Previews: PreviewProvider {
            static var previews: some View {
                StoreView()
            }
        }
