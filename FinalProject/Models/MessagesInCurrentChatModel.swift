//
//  MessagesInCurrentChatModel.swift
//  FinalProject
//
//  Created by Vladimir on 11.08.2024.
//

import Foundation

// MARK: - Welcome
struct MessagesInChat: Codable {
    let success: Bool
    let data: CurrentChatDataClass
}

// MARK: - DataClass
struct CurrentChatDataClass: Codable {
    let items: [CurrentMessages]
}

// MARK: - Item
struct CurrentMessages: Codable {
    let id: String
    let internalID: Int
    let groupID: String?
    let fromAPI, fromMe: Bool
    let side: String
    let time: Int
    let status: String
    let error: Errors?
    let type: String
    let subtype: String?
    let message: Message
    let quotedMessage: QuotedMessage?
    let fromUser: FromUser
    let created: Created?
    let forwarded, edited: Bool
    let reactions: [Reaction]?

    enum CodingKeys: String, CodingKey {
        case id
        case internalID = "internalId"
        case groupID = "groupId"
        case fromAPI = "fromApi"
        case fromMe, side, time, status, error, type, subtype, message, quotedMessage, fromUser, created, forwarded, edited, reactions
    }
}

// MARK: - Created
struct Created: Codable {
    let id: Int
}

// MARK: - Error
struct Errors: Codable {
    let code, message: String
}

// MARK: - FromUser
struct FromUser: Codable {
    let id: String
    let username: String?
    let name, phone: String
    let email: String?
}

// MARK: - Message
struct Message: Codable {
    let text, caption: String
    let file: File?
    let location, template: String?
    let html: String
}

// MARK: - File
struct File: Codable {
    let link: String
    let name, contentType: String
}

// MARK: - QuotedMessage
struct QuotedMessage: Codable {
    let id, type: String
    let subtype: String?
    let message: Message
}

// MARK: - Reaction
struct Reaction: Codable {
    let reaction: String
    let count: Int
    let users: [User]
}

// MARK: - User
struct User: Codable {
    let id, name: String
}
