//
//  ContentView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todoManager: TodoManager
    @State private var numOfCoins: Int = 0
    @State private var numTaskCompleted: Int = 0
    
    var body: some View {
        TabView {
            HomeView(numOfCoins: $numOfCoins)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            TimerView(numOfCoins: $numOfCoins)
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            TodoView(todoManager: TodoManager())
                .tabItem {
                    Label("Todo", systemImage: "list.bullet")
                }
            StoreView()
                .tabItem {
                    Label("Store", systemImage: "bag")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todoManager: TodoManager())
    }
}

