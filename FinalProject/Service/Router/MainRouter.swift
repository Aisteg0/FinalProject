//
//  MainRouter.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 10.08.2024.
//

import SwiftUI
import Router

enum MainRoute: Routable {
    case chats
    case personalChat
    case settings
//    case profile(profile: PersonalInfo)
    
    var navigationType: NavigationType {
        return .push
    }
    
    @ViewBuilder
    func view(router: Router<MainRoute>) -> some View {
        switch self {
        case .chats:
            ContentView() //ChatsView()
        case .personalChat:
            ContentView() //PersonalChat()
        case .settings:
            ContentView() //SettingsView()
//        case .profile(let profile):
//            ProfileScreen(profile: profile)
        }
    }
}
