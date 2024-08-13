//
//  LicensesModel.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation

public struct LicensesModel: Codable {
    public let success: Bool
    public let data: [Datum]
}

public struct Datum: Codable {
   public let licenseId, licenseTo: Int
   public let licenseName: String?
   public let meOwner: Bool
   public let status: Status?
   public let messenger, app: [Apps]
   public let access: [Access]
   public let type: String
   public let companies: [Int]
}

public struct Access: Codable {
    public let userID, email: String

    public enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case email
    }
}

public struct Apps: Codable {
    public let type: String
    public let name: String
}

public struct Status: Codable {
   public let id: Int
   public let code: String
}

