
//
//  AuthManager.swift
//  FinalProject
//
//  Created by Vladimir on 12.08.2024.
//

import Foundation

protocol AuthManagerProtocol: ObservableObject {
    var isUserAuthorized: Bool { get }

    func authorizeUser()
    func logoutUser()
    func saveFullName(_ name: String)
    func getFullName() -> String?
    func saveEmail(_ email: String)
    func getEmail() -> String?
    func saveAvatar(_ avatar: String)
    func getAvatar() -> String?
}

final class AuthManager {
    @Published private(set) var isUserAuthorized: Bool = false
    private let storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
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
        storageManager.remove(forKey: .email)
    }
    
    func saveFullName(_ name: String) {
        storageManager.set(name, forKey: .fullName)
    }
    
    func getFullName() -> String? {
        storageManager.string(forKey: .fullName)
    }
    
    func saveEmail(_ email: String) {
        storageManager.set(email, forKey: .email)
    }
    
    func getEmail() -> String? {
        storageManager.string(forKey: .email)
    }
    
    func saveAvatar(_ avatar: String) {
        storageManager.set(avatar, forKey: .avatar)
    }
    
    func getAvatar() -> String? {
        storageManager.string(forKey: .avatar)
    }
    
}
