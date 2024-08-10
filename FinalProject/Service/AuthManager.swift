//
//  AuthManager.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 10.08.2024.
//

import SwiftUI

protocol AuthManagerProtocol: ObservableObject {
    var isUserAuthorized: Bool { get }

    func authorizeUser()
    func logoutUser()
    func savePhoneNumber(_ phoneNumber: String)
    func getPhoneNumber() -> String?
    func saveSMSCode(_ smsCode: String)
    func getSMSCode() -> String?
}

final class AuthManager {
    @Published private(set) var isUserAuthorized: Bool = false
    private let storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
        self.isUserAuthorized = storageManager.bool(forKey: .isAuthorized) ?? false
    }
}

// MARK: - AuthManagerProtocol
extension AuthManager: AuthManagerProtocol {
    func authorizeUser() {
        isUserAuthorized = true
        storageManager.set(isUserAuthorized, forKey: .isAuthorized)
    }
    
    func logoutUser() {
        isUserAuthorized = false
        storageManager.remove(forKey: .isAuthorized)
        storageManager.remove(forKey: .phoneNumber)
        storageManager.remove(forKey: .smsCode)
    }

    func savePhoneNumber(_ phoneNumber: String) {
        storageManager.set(phoneNumber, forKey: .phoneNumber)
    }

    func getPhoneNumber() -> String? {
        return storageManager.string(forKey: .phoneNumber)
    }

    func saveSMSCode(_ smsCode: String) {
        storageManager.set(smsCode, forKey: .smsCode)
    }

    func getSMSCode() -> String? {
        return storageManager.string(forKey: .smsCode)
    }
}
