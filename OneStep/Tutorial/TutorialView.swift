//
//  TutorialView.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI

struct TutorialView: View {
    
    @Binding var missionPath: NavigationPath
    @Binding var showTutorial: Bool
    
    @Binding var page: Int
    
    var body: some View {
        switch page {
            case 1:
            FirstTutorial(missionPath: $missionPath, page: $page, showTutorial: $showTutorial)
            case 2:
            SecondTutorial(missionPath: $missionPath, showTutorial: $showTutorial, page: $page)
            case 3:
            ThirdTutorial(missionPath: $missionPath, showTutorial: $showTutorial, page: $page)
            default:
                EmptyView()
        }
    }
}

//#Preview {
//    TutorialView()
//}
