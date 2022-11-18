//
//  progress view.swift
//  vlky
//
//  Created by Lindsey Choo on 16/11/22.
//

import SwiftUI

struct progress_view: View {
    var body: some View {
        NavigationView{
            List{
                Text("hours studied :")
                Text("To-Dos completed :")
                Text("coins received : \(numOfCoins)")
                        
            }
            .navigationTitle("Study session")
        }
    }
}

struct progress_view_Previews: PreviewProvider {
    static var previews: some View {
        progress_view()
    }
}
