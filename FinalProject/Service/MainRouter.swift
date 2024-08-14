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
    case profile(ProfileInfo)
    case theme
    case notifications
    case safety
    case inviteFriend
    
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
            SettingsView()
        case .profile(let profile):
            ProfileScreen(profile: profile)
        case .theme:
            ThemeView()
        case .notifications:
            NotificationsView()
        case .safety:
            Safety()
        case .inviteFriend:
            InviteFriendView()
        }
    }
}
