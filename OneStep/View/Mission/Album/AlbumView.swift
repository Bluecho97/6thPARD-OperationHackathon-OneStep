//
//  AlbumView.swift
//  OneStep
//
//  Created by Lucid on 8/19/25.
//

import SwiftUI

struct AlbumView: View {
    
    @Binding var missionPath: NavigationPath
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                InternalAlbumCell()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Array(AlbumDataModel.AlbumData.enumerated()), id: \.element.id) { index, album in
                        Image(album.Image)   // 모델의 Image 프로퍼티 사용
                            .resizable()
                            .scaledToFit()
                            .frame(width: 172, height: 256)
                            .cornerRadius(15)
                            .offset(y: index % 2 == 1 ? 16 : 0)
                    }
                }
                .padding(.bottom, 16)
            }
            .padding(16)
        }
        .background(Color(hex: "#FAF9F9"))
        .navigationBarBackButtonHidden(true)        // 기본 Back 버튼 숨김
        .navigationTitle("")                        // 기본 타이틀 숨김
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
            
            ToolbarItem(placement: .principal) {
                Text("한걸음 앨범")
                    .font(.system(size: 17, weight: .semibold))
            }
        }
    }
}

//#Preview {
//    AlbumView()
//}
