//
//  CustomChatView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import SwiftUI
import ExyteChat

struct CustomChatView: View {
    let message: Message
    let isOp: Bool
    
    var body: some View {
        MessageBubbleView(isOP: message.user.isCurrentUser ? true : false, message: message)
    }
}
