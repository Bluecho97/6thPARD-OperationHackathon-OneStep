//
//  AnalysisView.swift
//  OneStep
//
//  Created by Lucid on 8/18/25.
//

import SwiftUI


struct AnalysisView: View {
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            VStack {
                Text("촬영한 사진 분석중...")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color(hex: "#DF655D"))
                
                LottieView(lottieFile: "DoubleCircularLoader")
                    .frame(width: 380, height: 380)
                
                VStack {
                    Text("한걸음 AI가 미션 인증을 위해")
                    Text("사진을 분석하고 있어요!")
                }
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color(hex: "#C3C3C3"))
            }
        }
    }
}


#Preview {
    AnalysisView()
}
