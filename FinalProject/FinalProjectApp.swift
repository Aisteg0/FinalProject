//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
