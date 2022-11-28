//
//  ContentView.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI
 
struct ContentView: View {
    @StateObject var todoManager: TodoManager
    @AppStorage ("coins") var numOfCoins = 10
    @AppStorage ("DoneTask") var numTaskCompleted = 0
    @AppStorage ("TotalTask") var totalTasks = 1
    @AppStorage ("assets") var isAllAssetsViewPresented = false
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
//    init() {
//            UITabBar.appearance().backgroundColor = UIColor.white
//        }
    
//    @State var isFeedbackResponseViewPresented: Bool = false
    
    var body: some View {
        TabView {
            HomeView(numOfCoins: $numOfCoins)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
            
            CountupView(numOfCoins: $numOfCoins, hours: $hours, minutes: $minutes, seconds: $seconds)
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
            
            TodoView(numTaskCompleted: $numTaskCompleted, totalTasks: $totalTasks, todoManager: TodoManager())
                .tabItem {
                    Label("Todo", systemImage: "list.bullet")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
            
            ProgressView(numOfCoins: $numOfCoins, numTaskCompleted: $numTaskCompleted, totalTasks: $totalTasks, hours: $hours, minutes: $minutes, seconds: $seconds,todoManager: TodoManager())
                .tabItem {
                    Label("Progress", systemImage: "chart.xyaxis.line")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
            
            StoreView(numOfCoins: $numOfCoins, isAllAssetsViewPresented: $isAllAssetsViewPresented)
                .tabItem {
                    Label("Store", systemImage: "bag")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
            
        }
        
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todoManager: TodoManager())
    }
}


