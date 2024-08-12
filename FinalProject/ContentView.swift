//
//  ContentView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI
import Router

struct ContentView: View {
    
//    @StateObject var authManager = AuthManager
    
    var body: some View {
        RoutingView(AuthRoute.self) {
            VerificationNumberView()
        }
//        .environmentObject()
    }
}

#Preview {
    ContentView()
}
