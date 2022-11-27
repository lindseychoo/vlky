//
//  vlkyApp.swift
//  vlky
//
//  Created by Lindsey Choo on 22/10/22.
//

import SwiftUI

@main
struct vlkyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(todoManager: TodoManager())
        }
    }
}
