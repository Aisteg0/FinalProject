//
//  ContentView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 15) {
            Button("Get profile") {
                viewModel.getProfile()
            }
            Text(viewModel.profile.fullName ?? "Name")
            Text(viewModel.profile.email ?? "Email")
            Text(viewModel.profile.status ?? "Status")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
