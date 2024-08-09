//
//  licensesModel.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation

struct LicensesModel: Codable {
    let success: Bool
    let data: [Datum]
}

struct Datum: Codable {
    let licenseID, licenseTo: Int
    let licenseName: String?
    let meOwner: Bool
    let status: Status?
    let messenger, app: [App]
    let access: [Access]
    let type: String
    let companies: [Int]

    enum CodingKeys: String, CodingKey {
        case licenseID = "licenseId"
        case licenseTo, licenseName, meOwner, status, messenger, app, access, type, companies
    }
}

struct Access: Codable {
    let userID, email: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case email
    }
}

struct App: Codable {
    let type: TypeEnum
    let name: Name
}

enum Name: String, Codable {
    case bitrix24 = "Bitrix24"
    case telegram = "Telegram"
    case whatsAppBusinessAPI = "WhatsApp Business API"
    case whatsAppChatAPI = "WhatsApp [Chat API]"
}

enum TypeEnum: String, Codable {
    case bitrix = "bitrix"
    case grayWhatsApp = "grayWhatsApp"
    case telegram = "telegram"
    case whatsApp = "WhatsApp"
}

struct Status: Codable {
    let id: Int
    let code: String
}
