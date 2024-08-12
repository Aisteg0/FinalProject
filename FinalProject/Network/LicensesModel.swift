//
//  LicensesModel.swift
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
    let licenseId, licenseTo: Int
    let licenseName: String?
    let meOwner: Bool
    let status: Status?
    let messenger, app: [Apps]
    let access: [Access]
    let type: String
    let companies: [Int]
}

// MARK: - Access
struct Access: Codable {
    let userID, email: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case email
    }
}

// MARK: - App
struct Apps: Codable {
    let type: String
    let name: String
}

// MARK: - Status
struct Status: Codable {
    let id: Int
    let code: String
}

