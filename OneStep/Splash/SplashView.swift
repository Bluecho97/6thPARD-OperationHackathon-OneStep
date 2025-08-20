//
//  SplashView.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI


struct SplashView: View {
    
    var onLoginSuccess: () -> Void
//    @State private var isLoggedIn = false
    
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            VStack(spacing:  0) {
                Image("Splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 172, height: 276)
                    .padding(.vertical, 120)
                
                AppleLogIn {
//                    isLoggedIn = true
                    onLoginSuccess()
                }
            }
        }
    }
}


//#Preview {
//    SplashView()
//}
