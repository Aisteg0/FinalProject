//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI

@main
struct FinalProjectApp: SwiftUI.App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
