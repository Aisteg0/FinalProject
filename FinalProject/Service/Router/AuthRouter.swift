//
//  AuthRouter.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 10.08.2024.
//

import SwiftUI
import Router

enum AuthRoute: Routable {
    case verificationNumber
    case verificationCode
    
    var navigationType: NavigationType {
        return .push
    }
    
    @ViewBuilder
    func view(router: Router<AuthRoute>) -> some View {
        switch self {
        case .verificationNumber:
            VerificationNumberView() 
        case .verificationCode:
            VerificationCodeView()
        }
    }
}
