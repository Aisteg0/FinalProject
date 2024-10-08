//
//  AuthManager.swift
//  FinalProject
//
//  Created by Vladimir on 12.08.2024.
//

import Foundation
import Combine

public protocol AuthManagerProtocol: ObservableObject {
    var isUserAuthorized: Bool { get }
    
    func authorizeUser()
    func logoutUser()
    func saveFullName(_ name: String)
    func getFullName() -> String?
    func saveEmail(_ email: String)
    func getEmail() -> String?
    func saveAvatar(_ avatar: String)
    func getAvatar() -> String?
    func savePhoneNumber(_ phone: String)
    func getPhoneNumber() -> String?
}

public class AuthManager {
    @Published private(set) public var isUserAuthorized: Bool = false
    private let storageManager: StorageManagerProtocol
    
    public init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }
}

// MARK: - AuthManagerProtocol
extension AuthManager: AuthManagerProtocol {
    
    public func authorizeUser() {
        isUserAuthorized = true
        storageManager.set(isUserAuthorized, forKey: .isAuthorized)
    }
    
    public func logoutUser() {
        isUserAuthorized = false
        storageManager.remove(forKey: .isAuthorized)
        storageManager.remove(forKey: .phoneNumber)
        storageManager.remove(forKey: .email)
    }
    
    public func saveFullName(_ name: String) {
        storageManager.set(name, forKey: .fullName)
    }
    
    public func getFullName() -> String? {
        storageManager.string(forKey: .fullName)
    }
    
    public func saveEmail(_ email: String) {
        storageManager.set(email, forKey: .email)
    }
    
    public func getEmail() -> String? {
        storageManager.string(forKey: .email)
    }
    
    public func saveAvatar(_ avatar: String) {
        storageManager.set(avatar, forKey: .avatar)
    }
    
    public func getAvatar() -> String? {
        storageManager.string(forKey: .avatar)
    }
    
    public func savePhoneNumber(_ phone: String) {
        storageManager.set(phone, forKey: .phoneNumber)
    }
    
    public func getPhoneNumber() -> String? {
        storageManager.string(forKey: .phoneNumber)
    }
}
