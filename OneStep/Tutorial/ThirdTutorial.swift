//
//  ThirdTutorial.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI

struct ThirdTutorial: View {
    
    @Binding var missionPath: NavigationPath
    @Binding var showTutorial: Bool
    @Binding var page: Int
    
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            VStack(alignment: .leading, spacing: 32) {
                Button(action: {
                    page -= 1
                }, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color(hex: "#C2C6CD"))
                })
                
                Text("3주동안 꾸준히 미션을 성공하면\n더 넓은 세상으로 나아갈 수 있어요")
                    .font(.system(size: 22, weight: .semibold))
                
                Image("Tutorial3")
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
                        Text("시작하기")
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
                    missionPath.removeLast()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#C2C6CD"))
                }
            }
        }
    }
}

//#Preview {
//    ThirdTutorial()
//}
