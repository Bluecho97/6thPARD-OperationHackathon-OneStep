//
//  ContentView.swift
//  OneStep
//
//  Created by Lucid on 8/14/25.
//

import SwiftUI


struct ContentView: View {
    
    @State var missionPath = NavigationPath()
    
    @State var tabSelection: Tab = .home
    
    @State var isOnCamera = false
    @State var isShowAnalysis = false
    @State var capturedImage: UIImage?
    
    var body: some View {
        NavigationStack(path: $missionPath) {
            ZStack {
                switch tabSelection {
                case .home:
                    HomeView(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                case .mission:
                    MissionView(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                    //            case .store:
                    // 상점 뷰
                    //            case .my:
                    // 마이 뷰
                }
                
                CustomTabView(tabSelection: $tabSelection)
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                case "First": CertificationView(missionPath: $missionPath, capturedImage: $capturedImage)
//                case "Second": SecondView(path: $missionPath)
//                case "Third": ThirdView(path: $missionPath)
                default: Text("Invalid Page")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
