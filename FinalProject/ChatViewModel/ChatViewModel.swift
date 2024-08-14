//
//  ChatViewModel.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 12.08.2024.
//

import Foundation
import Combine
import KeychainAccess
import SwiftUI
import Models
import NetworkModule
import ExyteChat

final class ChatViewModel: ObservableObject {
    @Published var network = Network()
    @Published var items = [DataItem]()
    @Published var messages = [CurrentMessages]()
    @Published var uploadMessages = [CurrentMessages]()
    @Published var chatMessages = [ExyteChat.Message]()
    @Published var letsGo = false
    @Published var password = ""
    
    let keychain = Keychain(service: "openApi")
    
    private var cancellables = Set<AnyCancellable>()
    
    private var chatState = CurrentValueSubject<[CurrentMessages], Never>([])
    
    var messagesNew: AnyPublisher<[CurrentMessages], Never> {
        chatState
            .share()
            .eraseToAnyPublisher()
    }
    
    
    init() {
        getToken()
        getRandomCode()
    }
    
    func onStart() {
        let converteMessages =  messages.sorted(by: {$0.time < $1.time})
        chatMessages = converteMessages.map { $0.toMessageFromMe() }
    }
    
    func getMessages(from item: DataItem) {
        network.getMessages(with: keychain["token"], and: item)
            .assign(to: \.messages, on: self)
            .store(in: &self.cancellables)
        print(messages)
    }
    
//    func getUploadMessage(from item: DataItem) {
//        network.getMessages(with: keychain["token"], and: item)
//            .assign(to: \.uploadMessages, on: self)
//            .store(in: &self.cancellables)
//        
//        //        if uploadMessages.uniqued(on: messages) {
//        //
//        //        }
//    }
}

extension ChatViewModel {
    func send(draftMessage: DraftMessage, and item: DataItem) {
        Task {
            let message = await draftMessage.sendDraftMessage(user: draftMessage, and: item)
            DispatchQueue.main.async { [weak self] in
                self?.chatMessages.append(message.toMessageFromMe())
            }
        }
    }
}

extension ChatViewModel {
    func toMessages(from array: [CurrentMessages]) async -> [ExyteChat.Message] {
        var messages: [ExyteChat.Message] = []
        for message in array {
            let converted = message.toMessageFromMe()
            messages.append(converted)
        }
        
        return messages
    }
    
    func getToken() {
        network.postNewToken { [weak self] result in
            switch result {
            case .success(let token):
                self?.keychain["token"] = token
                print(token)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func refreshToken() {
        network.postRefreshToken { [weak self] result in
            switch result {
            case .success(let token):
                self?.keychain["token"] = token
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAllItems() {
        network.getAllItems(with: keychain["token"])
            .assign(to: \.items, on: self)
            .store(in: &self.cancellables)
        print(items)
    }
    
    func getProfile() {
        network.getInfoAboutAccount(with: keychain["token"])
    }
    
    func sendMessage(with item: DataItem, and message: String) {
        network.postSendMessage(in: item, keychain["token"], message)
    }
    
    func getRandomCode() { // функция должна где-то еще сохранять код, чтобы сымитировать верификацию пользователя
        password = ""
        for _ in 0..<4 {
            password += String(Int.random(in: 1...9))
        }
    }
    
    func letsGoToggle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            withAnimation {
                self.letsGo = true
            }
        }
    }
}
