//
//  AppleLogIn.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI
import AuthenticationServices

struct AppleLogIn: View {
    
    var onLoginSuccess: () -> Void
    
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: configure,
            onCompletion: handle
        )
        .signInWithAppleButtonStyle(.black)
        .frame(height: 50)
        .padding()
    }

    // 사용자가 로그인 버튼을 눌렀을 때 요청 설정
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }

    // 로그인 결과 처리
    func handle(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            if let credential = auth.credential as? ASAuthorizationAppleIDCredential {
                let userId = credential.user
                let email = credential.email ?? "(이전에 로그인하여 이메일 없음)"
                let fullName = credential.fullName?.givenName ?? ""

                print("🔓 로그인 성공")
                print("🧑‍💻 userId: \(userId)")
                print("📧 email: \(email)")
                print("👤 name: \(fullName)")
                
                // UserDefaults로 저장
                UserDefaults.standard.set(true, forKey: "isLoggedIn")           // 로그인 상태 저장
                UserDefaults.standard.set(userId, forKey: "appleUserId")        // 유저 고유 ID 저장
                UserDefaults.standard.set(email, forKey: "appleUserEmail")      // 이메일 저장
                UserDefaults.standard.set(fullName, forKey: "appleUserName")    // 이름 저장

                // 부모 뷰에 알려주기
                onLoginSuccess()
            }
        case .failure(let error):
            print("❌ 로그인 실패: \(error.localizedDescription)")
        }
    }
}

//#Preview {
//    AppleLogIn(onLoginSuccess: () -> Void)
//}
