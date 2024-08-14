//
//  AllItemsModel.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation

public struct ItemsModel: Codable {
   public let success: Bool
   public let data: DataClass
}

public struct DataClass: Codable {
    public let items: [DataItem]
}

public struct DataItem: Codable, Hashable {
   public let id: String
   public let internalId, licenseId: Int
   public let messengerType, type: String
   public let phone: String?
   public let username, email: String?
   public let name: String
   public let image: String?
   public let lastTime, unreadMessages, lastRead, timeLastInMessage: Int?
   public let conversation: Conversation?
   public let banTime: Int?
   public let link: String?
   public let responsible: Responsible?
   public let status: String?
   public let responsiblePin: Bool
   public let search: Search?
   public let lastMessage: LastMessage?
}

public struct Responsible: Codable, Hashable {
    public let id: Int?
}

public struct Advert: Codable {
    public let id, name: String
}

public struct Conversation: Codable, Hashable {
    public let startTime, endTime: Int
    public let type: String
}

public struct LastMessage: Codable, Hashable {
    public let type, previewText: String
}

public struct Search: Codable, Hashable {
    public let highlights: Highlights
    public let messages: Messages
}

public struct Highlights: Codable, Hashable {
    public let nameUsernamePhoneEmailMessageTextMessageCaptionMessageFileName: [String]

    public enum CodingKeys: String, CodingKey {
        case nameUsernamePhoneEmailMessageTextMessageCaptionMessageFileName = "name|username|phone|email|messageText|messageCaption|messageFileName"
    }
}

public struct Messages: Codable, Hashable {
    public let count: Int
    public let items: [MessagesItem]
}

public struct MessagesItem: Codable, Hashable {
   public let messageId: String
   public let internalId, time: Int
}

public struct CategoryClass: Codable {
    public let id: Int
    public let name: String
    public let sort: Int
}
