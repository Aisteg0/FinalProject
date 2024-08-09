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
}

enum PersonalData: String {
    case email = "viktorlala@yandex.ru"
    case password = "Viski1357("
    case appid = "app_49442_1"
}
