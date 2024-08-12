//
//  ApiData.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation

internal enum API: String {
    case url = "https://api.chatapp.online"
}
internal enum Token: String {
    case getToken = "/v1/tokens"
    case refreshToken = "/v1/tokens/refresh"
}

internal enum Chats: String {
    case licenses = "/v1/licenses"
    case allChats = "/v1/chats"
    case currentMessage = "v1/licenses/{licenseId/messengers/{messengerType}/chats/{chatId}/messages/text"
}

internal enum MessageBuilder: String {
    case licenses = "/v1/licenses/"
    case messenger = "/messengers/"
    case chatId = "/chats/"
    case messageAndText = "/messages/text"
}

internal enum ProfileInfoURL: String {
    case me = "/v1/me"
}


internal enum PersonalData: String {
    case email = "1"
    case password = "2"
    case appid = "3"
}
