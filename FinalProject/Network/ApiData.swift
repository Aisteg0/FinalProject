//
//  ApiData.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation

enum API: String {
    case url = "https://api.chatapp.online"
}
enum Token: String {
    case getToken = "/v1/tokens"
    case refreshToken = "/v1/tokens/refresh"
}

enum Chats: String {
    case licenses = "/v1/licenses"
    case allChats = "/v1/chats"
    case currentMessage = "v1/licenses/{licenseId/messengers/{messengerType}/chats/{chatId}/messages/text"
}

enum MessageBuilder: String {
    case licenses = "/v1/licenses/"
    case messenger = "/messengers/"
    case chatId = "/chats/"
    case messageAndText = "/messages/text"
}

enum ProfileInfoURL: String {
    case me = "/v1/me"
}


enum PersonalData: String {
    case email = "email1"
    case password = "hello"
    case appid = "blabla"
}
