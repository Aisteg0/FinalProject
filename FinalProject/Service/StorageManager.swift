//
//  StorageManager.swift
//  FinalProject
//
//  Created by Vladimir on 12.08.2024.
//

import Foundation

protocol StorageManagerProtocol {
    func set(_ object: Any?, forKey key: StorageManager.Keys)
    func set<T: Encodable>(object: T?, forKey key: StorageManager.Keys)
    func string(forKey key: StorageManager.Keys) -> String?
    func remove(forKey key: StorageManager.Keys)
}

final class StorageManager {
    enum Keys: String {
        case isAuthorized
        case fullName
        case phoneNumber
        case email
        case avatar
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

// MARK: - StorageManagerProtocol
extension StorageManager: StorageManagerProtocol {
    
    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    func set<T: Encodable>(object: T?, forKey key: Keys) {
        let jsonData = try? JSONEncoder().encode(object)
        store(jsonData, key: key.rawValue)
    }

    func string(forKey key: Keys) -> String? {
        restore(forKey: key.rawValue) as? String
    }
    
    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
