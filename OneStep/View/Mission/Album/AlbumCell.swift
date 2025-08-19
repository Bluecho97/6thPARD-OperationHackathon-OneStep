//
//  AlbumCell.swift
//  OneStep
//
//  Created by Lucid on 8/19/25.
//

import SwiftUI

struct AlbumCell: View {
    
    @Binding var missionPath: NavigationPath
    
    var body: some View {
        Button(action: {
            missionPath.append("Album")
        }, label: {
            HStack(spacing: 12) {
                VStack(alignment: .leading) {
                    Text("나의 한걸음을 기록해요")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "#A5A9B3"))
                    Text("한걸음 앨범")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Color(hex: "#000000"))
                }
                
                Spacer()
                
                Image("Album")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color(hex: "#C2C6CD"))
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "#FFFFFF"))
            )
        })
    }
}

//#Preview {
//    ZStack {
//        Color.gray.opacity(0.5).ignoresSafeArea(edges: .all)
//        AlbumCell()
//    }
//}
