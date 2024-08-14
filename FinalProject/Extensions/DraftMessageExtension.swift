//
//  DraftMessage+.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import Foundation
import ExyteChat
import Models

extension DraftMessage {
    func sendDraftMessage(user: DraftMessage, and item: DataItem) async -> CurrentMessages {
        CurrentMessages(
            id: user.id ?? "",
            internalID: item.internalId,
            groupID: "",
            fromAPI: false,
            fromMe: true,
            side: "in",
            time: Int(Date().timeIntervalSince1970),
            status: nil,
            error: nil,
            type: "text",
            subtype: nil,
            message: Message(text: user.text, caption: "", file: nil, location: nil, template: nil, html: ""),
            quotedMessage: nil,
            fromUser: FromUser(id: user.id ?? "", username: nil, name: "Vladimir", phone: nil, email: nil),
            created: nil,
            forwarded: false,
            edited: false,
            reactions: nil
        )
    }
}
