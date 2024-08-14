//
//  PersonalChatView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import SwiftUI
import ExyteChat
import ExyteMediaPicker
import Models

struct PersonalChatView: View {
    
    let item: DataItem
    @EnvironmentObject var viewModel: ChatViewModel
    
    var body: some View {
        ChatView(messages: viewModel.chatMessages) { draft in
            viewModel.send(draftMessage: draft, and: item)
        } messageBuilder: { message, positionInGroup, positionInCommentsGroup, showContextMenuClosure, messageActionClosure, showAttachmentClosure in
            CustomChatView(message: message, isOP: true)
        }
        .chatTheme(colors: .init(mainBackground: .accent4))
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
