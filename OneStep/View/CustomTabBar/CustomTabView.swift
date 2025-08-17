//
//  CustomTabBar.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct CustomTabView: View {
    
    @Binding var tabSelection: Tab
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(Color(hex: "#FFFFFF"))
                    .frame(height: 112)
                    .clipShape(RoundedCorners(radius: 30, corners: [.topLeft, .topRight]))
                
                HStack {
                    Spacer()
                    
                    Button {
                        tabSelection = .home
                    } label: {
                        tabSelection == .home ? ButtonView(imageName: "Home_on") : ButtonView(imageName: "Home_off")
                    }
                    
                    Spacer()
                    
                    Button {
                        tabSelection = .mission
                    } label: {
                        tabSelection == .mission ? ButtonView(imageName: "Mission_on") : ButtonView(imageName: "Mission_off")
                    }
                    
                    Spacer()
                    
//                    Button {
//                        tabSelection = .store
//                    } label: {
//                        tabSelection == .store ? ButtonView(imageName: "Store_on") : ButtonView(imageName: "Store_off")
//                    }
//                    
//                    Spacer()
//                    
//                    Button {
//                        tabSelection = .my
//                    } label: {
//                        tabSelection == .my ? ButtonView(imageName: "My_on") : ButtonView(imageName: "My_off")
////                    }
//                    
//                    Spacer()
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}


// 모서리 라운드로 만드는 함수
struct RoundedCorners: Shape {
    var radius: CGFloat = 20
    var corners: UIRectCorner = [.topLeft, .topRight]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


// 커스텀 탭바의 버튼뷰
struct ButtonView: View {
    
    var imageName: String
    
    var body: some View {
        VStack {
            Image("\(imageName)")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 52)
                .foregroundColor(.black)
        }
    }
}


#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(.all)
        
        StatefulPreviewWrapper(Tab.home) { binding in
            CustomTabView(tabSelection: binding)
        }
    }
}

