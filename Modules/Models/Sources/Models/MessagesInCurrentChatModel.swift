//
//  MessagesInCurrentChatModel.swift
//  FinalProject
//
//  Created by Vladimir on 11.08.2024.
//

import Foundation

public struct MessagesInChat: Codable {
    public let success: Bool
    public let data: CurrentChatDataClass
}

public struct CurrentChatDataClass: Codable {
    public let items: [CurrentMessages]
}

public struct CurrentMessages: Codable {
   public let id: String
   public let internalID: Int
   public let groupID: String?
   public let fromAPI, fromMe: Bool
   public let side: String
   public let time: Int
   public let status: String?
   public let error: Errors?
   public let type: String
   public let subtype: String?
   public let message: Message
   public let quotedMessage: QuotedMessage?
   public let fromUser: FromUser
   public let created: Created?
   public let forwarded, edited: Bool
   public let reactions: [Reaction]?

    public enum CodingKeys: String, CodingKey {
        case id
        case internalID = "internalId"
        case groupID = "groupId"
        case fromAPI = "fromApi"
        case fromMe, side, time, status, error, type, subtype, message, quotedMessage, fromUser, created, forwarded, edited, reactions
    }
}

public struct Created: Codable {
    public let id: Int
}

public struct Errors: Codable {
    public let code, message: String
}

public struct FromUser: Codable {
    public let id: String
    public let username: String?
    public let name, phone: String?
    public let email: String?
}

public struct Message: Codable {
    public let text, caption: String
    public let file: File?
    public let location, template: String?
    public let html: String
}

public struct File: Codable {
    public let link: String
    public let name, contentType: String
}

public struct QuotedMessage: Codable {
    public let id, type: String
    public let subtype: String?
    public let message: Message
}

public struct Reaction: Codable {
    public  let reaction: String
    public  let count: Int
    public  let users: [User]
}

public struct User: Codable {
    public let id, name: String
}
