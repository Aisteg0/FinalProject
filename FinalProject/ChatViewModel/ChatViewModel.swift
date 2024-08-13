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

final class ChatViewModel: ObservableObject {
    @Published var network = Network()
    @Published var items = [DataItem]()
    @Published var datum = [Datum]()
    @Published var messages = [CurrentMessages]()
    @Published var letsGo = false
    @Published var password = ""
    let keychain = Keychain(service: "openApi")
    let user = UserDefaults.standard
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getToken()
        getRandomCode()
    }
    
    private func getToken() {
        network.postNewToken() { [weak self] result in
            switch result {
            case .success(let token):
                self?.keychain["token"] = token
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
