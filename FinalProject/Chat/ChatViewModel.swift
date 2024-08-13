//
//  ChatViewModel.swift
//  FinalProject
//
//  Created by Vladimir on 13.08.2024.
//

import Foundation
import Combine
import KeychainAccess
import NetworkModule
import Models
import ExyteChat

final class ChatViewModel: ObservableObject {
    @Published var network = Network()
    @Published var items = [DataItem]()
    @Published var datum = [Datum]()
    @Published var messages = [CurrentMessages]()
    @Published var chatMessages = [Messages]()
    let keychain = Keychain(service: "openApi")
    
    private var cancellables = Set<AnyCancellable>()
    
    private var chatState = CurrentValueSubject<[CurrentMessages], Never>([])
    
    
    init() {
        getToken()
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
    
    func getDatum() {
        network.getLicenses(with: keychain["token"])
            .assign(to: \.datum, on: self)
            .store(in: &self.cancellables)
    }

    func getProfile() {
        network.getInfoAboutAccount(with: keychain["token"])
    }

    func sendMessage(with item: DataItem, and message: String) {
        network.postSendMessage(in: item, keychain["token"], message)
    }

    func getMessages(from item: DataItem) {
        network.getMessages(with: keychain["token"], and: item)
            .assign(to: \.messages, on: self)
            .store(in: &self.cancellables)
    }
}

//extension ChatViewModel {
//    func send(draftMessage: DraftMessage) {
//           if draftMessage.id != nil {
//               guard let index = chatState.value.firstIndex(where: { $0.id == draftMessage.id }) else {
//                   // TODO: Create error
//                   return
//               }
//               chatState.value.remove(at: index)
//           }
//
//           Task {
//               let message = await draftMessage.toMockMessage(user: chatData.tim, status: status)
//               DispatchQueue.main.async { [weak self] in
//                   self?.chatState.value.append(message)
//               }
//           }
//       }
//}
