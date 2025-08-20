//
//  AppState.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI

// 로그인 상태를 관리할 뷰모델
class AppState: ObservableObject {
    
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    init() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}
