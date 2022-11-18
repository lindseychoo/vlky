//
//  ContentView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var numOfCoins: Int = 0
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            TimerView(numOfCoins: $numOfCoins)
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            StoreView()
                .tabItem {
                    Label("Store", systemImage: "bag")
                }
            TodoView(numOfCoins: $numOfCoins)
                .tabItem {
                    Label("Todo", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

