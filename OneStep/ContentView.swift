//
//  ContentView.swift
//  OneStep
//
//  Created by Lucid on 8/14/25.
//

import SwiftUI


struct ContentView: View {
    
//    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    @State var missionPath = NavigationPath()
    
    @State var tabSelection: Tab = .home
    
    @State var showTutorial = true
    
    @State var isOnCamera = false
    @State var isShowAnalysis = false
    @State var capturedImage: UIImage?
    
    @State var page: Int = 1
    
    var body: some View {
        NavigationStack(path: $missionPath) {
            ZStack {
                switch tabSelection {
                case .home:
                    HomeView(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                case .mission:
                    MissionView(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                case .store:
                    ShopView()
                case .my:
                    MyView()
                }
                
                CustomTabView(tabSelection: $tabSelection)
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                case "Certificate": CertificationView(missionPath: $missionPath, capturedImage: $capturedImage)
                case "Album": AlbumView(missionPath: $missionPath)
                case "SecondTutorial": SecondTutorial(missionPath: $missionPath, showTutorial: $showTutorial, page: $page)
                case "ThirdTutorial": ThirdTutorial(missionPath: $missionPath, showTutorial: $showTutorial, page: $page)
                default: Text("Invalid Page")
                }
            }
        }
        .fullScreenCover(isPresented: $showTutorial) {
            TutorialView(missionPath: $missionPath, showTutorial: $showTutorial, page: $page)
        }
        
    }
}


#Preview {
    ContentView()
}
