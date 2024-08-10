//
//  ProfileInfoModel.swift
//  FinalProject
//
//  Created by Vladimir on 10.08.2024.
//

import Foundation

struct Profile: Codable {
    let success: Bool
    let data: DataClass
}

struct ProfileInfo: Codable {
    let id: Int
    let fullName, email: String
    let avatar: String
    let status, workday: String
}

