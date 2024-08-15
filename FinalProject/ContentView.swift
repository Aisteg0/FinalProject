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
                ChatsList() // replace
            }
            .environmentObject(authManager)
        } else {
            RoutingView(AuthRoute.self) {
                VerificationNumberScreen()
            }
            .environmentObject(authManager)
        }
    }
}

#Preview {
    ContentView()
}
