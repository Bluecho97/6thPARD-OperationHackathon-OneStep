//
//  Comment.swift
//  OneStep
//
//  Created by Lucid on 8/16/25.
//

import SwiftUI


struct CommentCell: View {
    
    var commentText1: String = "병희님, 오늘도 "
    var commentText2: String = "한걸음 "
    var commentText3: String = "딛어보아요!"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text(commentText1)
                Text(commentText2).bold()
                Text(commentText3)
            }
            .font(.system(size: 14))
            .foregroundColor(Color(hex: "#706360"))
            .padding(12)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(hex: "#EDEDED"))
            )
            
            RoundedTriangle(cornerRadius: 1)
                .fill(Color(hex: "#EDEDED"))
                .frame(width: 16, height: 16)
                .rotationEffect(.degrees(180))
                .offset(x: 25, y: -9)
        }
    }
}


// RoundedTriangle
struct RoundedTriangle: Shape {
    
    var cornerRadius: CGFloat = 6.0
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let r = min(cornerRadius, width/2, height/2) // 최대 반지름 제한
        
        var path = Path()
        
        // 위 꼭짓점
        path.move(to: CGPoint(x: width/2, y: 0 + r))
        path.addQuadCurve(to: CGPoint(x: width/2 - r, y: 0),
                          control: CGPoint(x: width/2, y: 0))
        
        // 왼쪽 아래 꼭짓점
        path.addLine(to: CGPoint(x: 0 + r, y: height - r))
        path.addQuadCurve(to: CGPoint(x: 0, y: height),
                          control: CGPoint(x: 0, y: height - r))
        
        // 오른쪽 아래 꼭짓점
        path.addLine(to: CGPoint(x: width - r, y: height))
        path.addQuadCurve(to: CGPoint(x: width, y: height - r),
                          control: CGPoint(x: width, y: height))
        
        // 다시 위 꼭짓점
        path.addLine(to: CGPoint(x: width/2 + r, y: 0))
        path.addQuadCurve(to: CGPoint(x: width/2, y: r),
                          control: CGPoint(x: width/2, y: 0))
        
        path.closeSubpath()
        
        return path
    }
}


#Preview {
    CommentCell()
}
