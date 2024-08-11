//
//  AllItemsModel.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation

struct ItemsModel: Codable {
    let success: Bool
    let data: DataClass
}

struct DataClass: Codable {
    let items: [DataItem]
}

struct DataItem: Codable {
    let id: String
    let internalId, licenseId: Int
    let messengerType, type: String
    let phone: String?
    let username, email: String?
    let name: String
    let image: String
    let lastTime, unreadMessages, lastRead, timeLastInMessage: Int?
    let conversation: Conversation?
    let banTime: Int?
    let link: String?
    let responsible: Responsible
    let status: String?
    let responsiblePin: Bool
    let search: Search?
    let lastMessage: LastMessage?
}

struct Responsible: Codable {
    let id: Int
}

struct Advert: Codable {
    let id, name: String
}

struct Conversation: Codable {
    let startTime, endTime: Int
    let type: String
}

struct LastMessage: Codable {
    let type, previewText: String
}

struct Search: Codable {
    let highlights: Highlights
    let messages: Messages
}

struct Highlights: Codable {
    let nameUsernamePhoneEmailMessageTextMessageCaptionMessageFileName: [String]

    enum CodingKeys: String, CodingKey {
        case nameUsernamePhoneEmailMessageTextMessageCaptionMessageFileName = "name|username|phone|email|messageText|messageCaption|messageFileName"
    }
}

struct Messages: Codable {
    let count: Int
    let items: [MessagesItem]
}

struct MessagesItem: Codable {
    let messageId: String
    let internalId, time: Int
}

struct CategoryClass: Codable {
    let id: Int
    let name: String
    let sort: Int
}
