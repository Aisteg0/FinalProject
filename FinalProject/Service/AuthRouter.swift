//
//  AuthRouter.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 10.08.2024.
//

import SwiftUI
import Router

enum AuthRoute: Routable {
    case login
    case verification
    
    var navigationType: NavigationType {
        return .push
    }
    
    @ViewBuilder
    func view(router: Router<AuthRoute>) -> some View {
        switch self {
        case .login:
            ContentView() //LoginView()
        case .verification:
            ContentView() //VerificationView()
        }
    }
}
