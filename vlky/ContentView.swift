//
//  ContentView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            StoreView()
                .tabItem {
                    Label("Store", systemImage: "bag")
                }
            TodoView()
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

