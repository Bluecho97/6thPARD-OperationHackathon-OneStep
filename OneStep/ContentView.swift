//
//  ContentView.swift
//  OneStep
//
//  Created by Lucid on 8/14/25.
//

import SwiftUI


struct ContentView: View {
    
    @State var tabSelection: Tab = .home
    
    var body: some View {
        ZStack {
            switch tabSelection {
            case .home:
                HomeView()
            case .mission:
                MissionView()
            case .store:
                 ShopView()
            case .my:
                 MyView()
            }
            
            CustomTabView(tabSelection: $tabSelection)
        }
    }
}


#Preview {
    ContentView()
}
