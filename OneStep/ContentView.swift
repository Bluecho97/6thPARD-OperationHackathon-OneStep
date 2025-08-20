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
    
    
    @StateObject var purchaseManager = PurchaseManager()
    @StateObject var manager = CouponManager()
    @StateObject var infoManager = InfoManager()
    
    var body: some View {
        NavigationStack(path: $missionPath) {
            ZStack {
                switch tabSelection {
                case .home:
                    HomeView(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                case .mission:
                    MissionView(missionPath: $missionPath, isOnCamera: $isOnCamera, isShowAnalysis: $isShowAnalysis, capturedImage: $capturedImage)
                case .store:
                    ShopView(path: $missionPath, purchaseManager: purchaseManager)
                case .my:
                    MyView(path: $missionPath, manager:manager, infoManager:infoManager)
                }
                
                CustomTabView(tabSelection: $tabSelection)
                
                if manager.showModal{
                    if let selected = manager.selectedCoupon {
                        CouponModal(coupon: selected, manager: manager)
                    }
                }
                if infoManager.showInfo{
                    InfoModal(manager: infoManager)
                }
                if purchaseManager.isShowingPurchase {
                    PurchaseModal(purchaseManager: purchaseManager)
                        .ignoresSafeArea()
                        .zIndex(2) // 항상 최상단
                }
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
        .fullScreenCover(isPresented: $purchaseManager.isShowingPurchase) {
            PurchaseModal(purchaseManager: purchaseManager)
                .background(Color.clear)
        }
        .fullScreenCover(isPresented: $manager.showModal) {
            if let selected = manager.selectedCoupon {
                CouponModal(coupon: selected, manager: manager)
                    .background(Color.clear)
            }
        }
        
        
    }
}


#Preview {
    ContentView()
}
