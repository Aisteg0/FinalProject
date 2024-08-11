//
//  ExampleModel.swift
//  FinalProject
//
//  Created by Михаил Ганин on 11.08.2024.
//

import Foundation

// MARK: Модель для примера

struct DataItemExample: Codable {
    let name: String
    let image: String
    let lastTime, unreadMessages, lastRead, timeLastInMessage: Int?
    let lastMessage: LastMessage?
}

struct LastMessage: Codable {
    let type, previewText: String
}
