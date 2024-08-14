//
//  MessageBubbleView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import SwiftUI
import ExyteChat

struct MessageBubbleView: View {
    @Environment(\.locale) var locale
    @State private var statusStruct = Status()
    var isOP: Bool
    var message: Message
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    isOP ? Spacer() : nil
                    VStack(alignment: .leading) {
                        Text(message.text)
                            .padding(.all, 10)
                            .font(.system(size: 14))
                            .foregroundStyle(isOP == true ? .white : .colorForText)
                        
                        TimeAndStatusView(message: message, isOP: isOP, statusStruct: statusStruct)
                    }
                    .background(isOP == true ? .accent6 : .accent4)
                    .clipShape(MessageBubbleShape(direction: isOP ? .right : .left))
                    isOP ? nil : Spacer()
                }
            }
        }
        .padding((isOP ? .leading : .trailing), 90.0)
        .padding(.vertical, 5)
        
    }
}

struct Status {
    func getStatus(status: Message.Status?) -> String {
        switch status {
        case .sending:
            return "Отправляется"
        case .sent:
            return "Отправлено"
        case .read:
            return "Прочитано"
        case .error(let error):
            return error.text.localizedLowercase
        case .none:
            return ""
        }
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static private var shortMessage = "Hi, buddy!"
    static private var longMessage = "Hello hello hello hello hello hello hello hello hello hello hello hello hello\n hello hello hello hello d d d d d d d d"

    static private var message = Message(
        id: UUID().uuidString,
        user: User(id: UUID().uuidString, name: "Stan", avatarURL: nil, isCurrentUser: false),
        status: .read,
        text: longMessage,
        attachments: []
    )
    static var previews: some View {
        MessageBubbleView(isOP: false, message: message)
            .frame(width: 200, height: 100)
    }
}
