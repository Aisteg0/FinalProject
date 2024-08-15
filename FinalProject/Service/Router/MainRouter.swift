//
//  MainRouter.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 10.08.2024.
//

import SwiftUI
import Router
import Models

enum MainRoute: Routable, Hashable {
    case chats
    case personalChat(DataItem)
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
            ChatsList()
        case .personalChat(let item):
            PersonalChatScreen(item: item)
        case .settings:
            SettingsScreen()
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
