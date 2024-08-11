//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI
import Router

@main
struct FinalProjectApp: App {
    @StateObject private var authManager = AuthManager(storageManager: StorageManager())
    
    var body: some Scene {
        WindowGroup {
            if authManager.isUserAuthorized {
                RoutingView(MainRoute.self) {
                    SettingsView() //ChatsView()
                }
                .environmentObject(authManager)
            } else {
                RoutingView(MainRoute.self) {
                    SettingsView() //LoginView()
                }
                .environmentObject(authManager)
            }
        }
    }
}
