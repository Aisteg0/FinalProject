//
//  APIData.swift
//  FinalProject
//
//  Created by Vladimir on 13.08.2024.
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
    case messages = "/messages"
}

internal enum ProfileInfoURL: String {
    case me = "/v1/me"
}


internal enum PersonalData: String {
    case email = "SergeyD0205@yandex.ru"
    case password = "16a85a64eac5302945dcf541777b0bf0"
    case appid = "app_29499_1"
}
