//
//  Messages.swift
//  FinalProject
//
//  Created by Vladimir on 13.08.2024.
//

public struct MessagesInChat: Codable {
    public let success: Bool
    public let data: CurrentChatDataClass
}

public struct CurrentChatDataClass: Codable {
    public let items: [CurrentMessages]
}

public struct CurrentMessages: Codable {
    public let uid = UUID()
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
    
    public init(id: String, internalID: Int, groupID: String?, fromAPI: Bool, fromMe: Bool, side: String, time: Int, status: String?, error: Errors?, type: String, subtype: String?, message: Message, quotedMessage: QuotedMessage?, fromUser: FromUser, created: Created?, forwarded: Bool, edited: Bool, reactions: [Reaction]?) {
        self.id = id
        self.internalID = internalID
        self.groupID = groupID
        self.fromAPI = fromAPI
        self.fromMe = fromMe
        self.side = side
        self.time = time
        self.status = status
        self.error = error
        self.type = type
        self.subtype = subtype
        self.message = message
        self.quotedMessage = quotedMessage
        self.fromUser = fromUser
        self.created = created
        self.forwarded = forwarded
        self.edited = edited
        self.reactions = reactions
    }

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
    
    public init(id: String, username: String?, name: String?, phone: String?, email: String?) {
        self.id = id
        self.username = username
        self.name = name
        self.phone = phone
        self.email = email
    }
}

public struct Message: Codable {
    public let text, caption: String
    public let file: File?
    public let location, template: String?
    public let html: String
    
    public init(text: String, caption: String, file: File?, location: String?, template: String?, html: String) {
        self.text = text
        self.caption = caption
        self.file = file
        self.location = location
        self.template = template
        self.html = html
    }
}

public struct File: Codable {
    public let link: String
    public let name, contentType: String
}

public struct QuotedMessage: Codable {
    public let id, type: String
    public let subtype: String?
    public let message: Message
    
    public init(id: String, type: String, subtype: String?, message: Message) {
        self.id = id
        self.type = type
        self.subtype = subtype
        self.message = message
    }
}

public struct Reaction: Codable {
    public  let reaction: String
    public  let count: Int
    public  let users: [User]
}

public struct User: Codable {
    public let id, name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

extension CurrentMessages {
    public func toMessageFromMe() -> ExyteChat.Message {
        ExyteChat.Message(
            id: uid.uuidString,
            user: ExyteChat.User(id: fromUser.id, name: fromUser.name ?? "No name", avatarURL: nil, isCurrentUser: fromMe),
            status: getStatus(with: self),
            createdAt: Date(timeIntervalSince1970: TimeInterval(time)),
            text: message.text,
            attachments: [],
            recording: nil,
            replyMessage: nil
        )
    }
    
    private func getStatus(with message: CurrentMessages) -> ExyteChat.Message.Status {
        var statusMessage: ExyteChat.Message.Status = .read
        switch message.status {
        case .none:
            print("")
        case .some(let status):
            switch status {
            case "viewed":
                statusMessage = .read
            case "delivered":
                statusMessage = .sent
            case "failed":
                statusMessage = .error(draftMessage(with: message))
            default:
                statusMessage = .sending
            }
        }

        return statusMessage
    }

    
    private func draftMessage(with message: CurrentMessages) -> DraftMessage {
            DraftMessage(text: message.message.text, medias: [], recording: nil, replyMessage: nil, createdAt: Date(timeIntervalSince1970: TimeInterval(message.time)))
        }
}
