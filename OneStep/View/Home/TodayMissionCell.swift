//
//  TodayOneStepCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI

struct TodayMissionCell: View {
    
    @Binding var missionPath: NavigationPath
    
    @Binding var isOnCamera: Bool
    @Binding var isShowAnalysis: Bool
    @Binding var capturedImage: UIImage?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("오늘의 한걸음")
                .font(.system(size: 20, weight: .semibold))
            
            ForEach(MissionDataModel.MissionData[0]) { item in
                MissionCell(mission: item, missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
            }
        }
        .padding(.bottom, 80)
    }
}


//#Preview {
//    ZStack {
//        Color.gray.opacity(0.2).ignoresSafeArea(edges: .all)
//        TodayMissionCell()
//    }
//}
