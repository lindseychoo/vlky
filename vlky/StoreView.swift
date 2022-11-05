//
//  StoreView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        HStack{
            Image(systemName:"dollarsign.circle.fill")
            Text("\(numOfCoins)")
        }
        padding()
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
