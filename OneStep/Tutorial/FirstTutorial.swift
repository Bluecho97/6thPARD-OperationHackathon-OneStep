//
//  FirstTutorial.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI

struct FirstTutorial: View {
    
    @Binding var missionPath: NavigationPath
    @Binding var page: Int
    @Binding var showTutorial: Bool
    
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            VStack(alignment: .leading, spacing: 32) {
                Button(action: {
                    showTutorial = false
                }, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color(hex: "#C2C6CD"))
                })
                
                
                Text("오늘의 날씨와 현재 유형에 맞는\n가볍고 실현 가능한 미션을 드려요")
                    .font(.system(size: 22, weight: .semibold))
                
                Image("Tutorial1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 32)
                
                Spacer()
                
                Button(action: {
                    if page < 3 {
                        page += 1
                    } else {
                        showTutorial = false
                    }
                }, label: {
                    HStack {
                        Spacer()
                        Text("다음으로")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(Color(hex: "#FFFFFF"))
                        Spacer()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(hex: "#DF655D"))
                            .frame(height: 68)
                    )
                })
                .padding(.bottom, 45)
            }
            .padding(16)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    
                } label: {
                    
                }
            }
        }
    }
}

//#Preview {
//    FirstTutorial()
//}
