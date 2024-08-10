//
//  ContentView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var text = ""
    var body: some View {
        VStack {
            Button("Items", action: {
                viewModel.fetchAllItems()
            })
            Text("\(viewModel.items.count)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
