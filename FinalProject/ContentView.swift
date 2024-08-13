//
//  ContentView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI
import KeychainAccess

struct ContentView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    var body: some View {
        NavigationStack {
            if viewModel.items.isEmpty {
                Button("GetItems", action: viewModel.getAllItems)
            } else {
                List(viewModel.items, id: \.name) { item in
                    NavigationLink {
                        ChatScreen(item: viewModel.messages)
                    } label: {
                        Button {
                            viewModel.getMessages(from: item)
                        } label: {
                            Text(item.name)
                        }

                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChatViewModel())
    }
}
