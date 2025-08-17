//
//  MissionView.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct MissionView: View {
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    CommentCell(tabStatus: .mission)
                        
                    VStack(alignment: .leading, spacing: 36) {
                        TodayCoinCell()
                        WeekMissionCell()
                        TodayMissionCell()
                    }
                }
            }
            .padding(16)
        }
        
    }
}


#Preview {
    MissionView()
}
