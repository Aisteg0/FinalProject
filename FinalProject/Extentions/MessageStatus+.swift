//
//  MessageStatus+.swift
//  FinalProject
//
//  Created by Vladimir on 13.08.2024.


import Foundation
import ExyteChat
import Models

extension ExyteChat.Message.Status {
    public func getStatus(with message: CurrentMessages) -> ExyteChat.Message.Status {
        var statusMessage: ExyteChat.Message.Status = .read
        switch message.status {
        case .none:
            print("")
        case .some(let status):
            switch status {
            case "viewed":
                statusMessage = .read
            case "delivered":
                statusMessage = .sent
            case "failed":
                statusMessage = .error(draftMessage(with: message))
            default:
                statusMessage = .sending
            }
        }
        
        return statusMessage
    }
    
    private func draftMessage(with message: CurrentMessages) -> DraftMessage {
            DraftMessage(text: message.message.text, medias: [], recording: nil, replyMessage: nil, createdAt: Date(timeIntervalSince1970: TimeInterval(message.time)))
        }
}
