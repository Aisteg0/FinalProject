//
//  Chats.swift
//  FinalProject
//
//  Created by Михаил Ганин on 11.08.2024.
//

import SwiftUI
import Models

// MARK: Пример как будут выглядеть чаты

struct Chats: View {
    
    var items: [DataItem] = []
    
    // MARK: Удалить потом фото из ассетов
//    var items: [DataItem] = [
//        DataItem(name: "Пользователь 1", image: "Example", lastTime: 5, unreadMessages: 2, lastRead: nil, timeLastInMessage: nil, lastMessage: LastMessage(type: "123", previewText: "hello")),
//        DataItem(name: "Пользователь 2", image: "Example", lastTime: 10, unreadMessages: nil, lastRead: nil, timeLastInMessage: nil, lastMessage: LastMessage(type: "123", previewText: "hello")),
//        DataItem(name: "Пользователь 3", image: "Example", lastTime: 3, unreadMessages: 1, lastRead: nil, timeLastInMessage: nil, lastMessage: LastMessage(type: "123", previewText: "hello"))
//        ]

    var body: some View {
        List(items, id: \.name) { item in
                    Cell(dataItem: item)
                }
        .listStyle(.inset)
    }
}

#Preview {
    Chats()
}
