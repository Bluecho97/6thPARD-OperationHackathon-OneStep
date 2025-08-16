//
//  HomeView.swift
//  OneStep
//
//  Created by Lucid on 8/14/25.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            ScrollView {
                VStack(spacing: 16) {
                    HStack(spacing: 0) {
                        CommentCell()
                        Spacer()
                        CoinCell()
                    }
                    
                    WeatherCell()
                        .padding(.bottom, 20)
                    
                    TodayMissionCell()
                }
            }
            .padding(16)
        }
    }
}


#Preview {
    HomeView()
}
