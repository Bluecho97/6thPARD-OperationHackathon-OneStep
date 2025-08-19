//
//  SplashView.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI


struct SplashView: View {
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            Image("Splash")
                .resizable()
                .scaledToFit()
                .frame(width: 172, height: 276)
        }
    }
}


#Preview {
    SplashView()
}
