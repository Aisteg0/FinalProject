//
//  ProfileModel.swift
//  FinalProject
//
//  Created by Vladimir on 10.08.2024.
//

import Foundation

// MARK: - Welcome
struct Profile: Codable {
    let success: Bool
    let data: PersonalInfo
}

// MARK: - DataClass
struct PersonalInfo: Codable {
    let id: Int
    let fullName, email: String
    let avatar: String
    let status, workday: String
}
