//
//  ContentView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI
import Router
import StorageModule

struct ContentView: View {
    
    @StateObject var authManager = AuthManager(storageManager: StorageManager())
    
    var body: some View {
        if authManager.isUserAuthorized {
            RoutingView(MainRoute.self) {
                ChatsView() // replace
            }
//            .environmentObject(authManager)
        } else {
            RoutingView(AuthRoute.self) {
                VerificationNumberView()
//                ChatsView()
            }
            .environmentObject(authManager)
        }
    }
}

#Preview {
    ContentView()
}
