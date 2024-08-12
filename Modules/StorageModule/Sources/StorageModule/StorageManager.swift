//
//  StorageManager.swift
//  FinalProject
//
//  Created by Vladimir on 12.08.2024.
//

import Foundation

public protocol StorageManagerProtocol {
    func set(_ object: Any?, forKey key: StorageManager.Keys)
    func set<T: Encodable>(object: T?, forKey key: StorageManager.Keys)
    func string(forKey key: StorageManager.Keys) -> String?
    func remove(forKey key: StorageManager.Keys)
}

public class StorageManager {
    public enum Keys: String {
        case isAuthorized
        case fullName
        case phoneNumber
        case email
        case avatar
    }
    
    private var userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
    public init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
}

// MARK: - StorageManagerProtocol
extension StorageManager: StorageManagerProtocol {
    
    public func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    public func set<T: Encodable>(object: T?, forKey key: Keys) {
        let jsonData = try? JSONEncoder().encode(object)
        store(jsonData, key: key.rawValue)
    }

    public func string(forKey key: Keys) -> String? {
        restore(forKey: key.rawValue) as? String
    }
    
    public func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
