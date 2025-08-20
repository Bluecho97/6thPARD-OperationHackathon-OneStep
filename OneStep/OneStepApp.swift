//
//  OneStepApp.swift
//  OneStep
//
//  Created by Lucid on 8/14/25.
//

import SwiftUI

@main
struct OneStepApp: App {
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isLoggedIn {
                ContentView()  // 메인 화면
            } else {
                SplashView {
                    appState.isLoggedIn = true
                }
            }
        }
    }
}
