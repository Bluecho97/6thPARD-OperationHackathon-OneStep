//
//  HomeView.swift
//  OneStep
//
//  Created by Lucid on 8/14/25.
//

import SwiftUI


struct HomeView: View {
    
    @Binding var missionPath: NavigationPath
    
    @Binding var isOnCamera: Bool
    @Binding var isShowAnalysis: Bool
    @Binding var capturedImage: UIImage?
    
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    HStack(spacing: 0) {
                        CommentCell(tabStatus: .home)
                        Spacer()
                        CoinCell()
                    }
                    
                    WeatherCell()
                        .padding(.bottom, 20)
                    
                    TodayMissionCell(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                }
            }
            .padding(16)
        }
    }
}


//#Preview {
//    HomeView()
//}
