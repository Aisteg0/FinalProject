//
//  ChatView.swift
//  FinalProject
//
//  Created by Vladimir on 13.08.2024.
//

import SwiftUI
import ExyteChat
import Models

struct ChatScreen: View {
    @EnvironmentObject var viewModel: ChatViewModel
    let item: DataItem
    var body: some View {
        ChatView(messages: viewModel.chatMessages) { draft in
            viewModel.send(draftMessage: draft, and: item)
            viewModel.sendMessage(with: item, and: draft.text)
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.getMessages(from: item)
                } label: {
                    Text("get new")
                }

            }
        })
        
        .task {
            Task {
                viewModel.onStart()
            }
        }
        .onAppear {
            viewModel.getMessages(from: item)
        }
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatScreen()
//    }
//}
