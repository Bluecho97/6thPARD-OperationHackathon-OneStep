//
//  MissionView.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct MissionView: View {
    
    @Binding var missionPath: NavigationPath
    
    @Binding var isOnCamera: Bool
    @Binding var isShowAnalysis: Bool
    @Binding var capturedImage: UIImage?
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                CommentCell(tabStatus: .mission)
                
                VStack(alignment: .leading, spacing: 36) {
                    TodayCoinCell()
                    WeekMissionCell(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                    TodayMissionCell(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                    AlbumCell(missionPath: $missionPath)
                        .padding(.bottom, 80)
                }
            }
            .padding(16)
        }
        .background(Color(hex: "#FAF9F9"))
    }
}


//#Preview {
//    MissionView()
//}
