//
//  RealNetwork.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation
import Models
import Combine
import StorageModule

public enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

public protocol NetworkProtocol {
    
    func postNewToken(_ completion: @escaping(Result<String, NetworkError>) -> Void)
    func postRefreshToken(_ completion: @escaping(Result<String, NetworkError>) -> Void)
    func postSendMessage(in messanger: DataItem, _ token: String?, _ text: String)
    func getAllItems(with token: String?) -> AnyPublisher<[DataItem], Never>
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void)
    func getInfoAboutAccount(with token: String?)
    
}

public class Network: NetworkProtocol, ObservableObject {
    
    private(set) public var user = AuthManager(storageManager: StorageManager())
    private(set) public var cancellables = Set<AnyCancellable>()
    
    public init(user: AuthManager = AuthManager(storageManager: StorageManager()), cancellables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.user = user
        self.cancellables = cancellables
    }
}

// MARK: POST - requests
extension Network {
    
    public func postNewToken(_ completion: @escaping(Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: postToken()) else {
            return completion(.failure(.invalidURL))
            
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        
        let json = [
            "email": PersonalData.email.rawValue,
            "password": PersonalData.password.rawValue,
            "appId": PersonalData.appid.rawValue
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: [])
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Fin")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { result in
                switch result {
                case (let data, _):
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                    guard let data = json["data"] as? [String: Any] else { return }
                    guard let accessToken = data["accessToken"] as? String else { return }
                    completion(.success(accessToken))
                }
            }
            .store(in: &cancellables)
    }
    
    public func postRefreshToken(_ completion: @escaping(Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: postRefreshToken()) else {
            return completion(.failure(.invalidURL))
            
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Fin")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { result in
                switch result {
                case (let data, _):
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                    guard let data = json["data"] as? [String: Any] else { return }
                    guard let refreshToken = data["accessToken"] as? String else { return }
                    completion(.success(refreshToken))
                }
            }
            .store(in: &cancellables)
    }
    
    
    public func postSendMessage(in messanger: DataItem, _ token: String?, _ text: String) {
        guard let url = URL(string: postSendMessage(with: messanger)) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        
        let json: [String : String] = ["text": text]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: json)
        } catch {
            print("Error: Unable to serialize payload")
        }
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .print()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Fin")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { _ in}
            .store(in: &cancellables)
    }
}

// MARK: Get - requests
extension Network {
    
    public func getAllItems(with token: String?) -> AnyPublisher<[DataItem], Never> {
        guard let url = URL(string: API.url.rawValue + Chats.allChats.rawValue) else {
            return  Just([DataItem]()).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        return fetch(request)
            .map { (response: ItemsModel) -> [DataItem] in
                return response.data.items
            }
            .replaceError(with: [DataItem]())
            .eraseToAnyPublisher()
    }
    
    public func getMessages(with token: String?, and messanger: DataItem) -> AnyPublisher<[CurrentMessages], Never>  {
        guard let url = URL(string: getMessages(with: messanger)) else {
            return  Just([CurrentMessages]()).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        print(request)
        return fetch(request)
            .map { (response: MessagesInChat) -> [CurrentMessages] in
                return response.data.items
            }
            .replaceError(with: [CurrentMessages]())
            .eraseToAnyPublisher()
    }
    
    public func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    public func getInfoAboutAccount(with token: String?) {
        guard let url = URL(string: getProfile()) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .print()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Fin")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { result in
                switch result {
                case (let data, _):
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                    guard let data = json["data"] as? [String: Any] else { return }
                    guard let name = data["fullName"] as? String else { return }
                    guard let email = data["email"] as? String else { return }
                    guard let avatar = data["avatar"] as? String else { return }
                    
                    self.getProfileInUserD(name: name, email: email, avatar: avatar)
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: func for me
extension Network {
    fileprivate func fetch<T: Decodable>(_ url: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

// MARK: URL - functions
extension Network {
    fileprivate func postToken() -> String {
        API.url.rawValue + Token.getToken.rawValue
    }
    
    fileprivate func postRefreshToken() -> String {
        API.url.rawValue + Token.refreshToken.rawValue
    }
    
    fileprivate func postSendMessage(with item: DataItem) -> String {
        print(item.licenseId)
        return API.url.rawValue
        + MessageBuilder.licenses.rawValue
        + String(item.licenseId)
        + MessageBuilder.messenger.rawValue
        + item.messengerType
        + MessageBuilder.chatId.rawValue
        + item.id
        + MessageBuilder.messageAndText.rawValue
    }
    
    fileprivate func getMessages(with item: DataItem) -> String {
        return API.url.rawValue
        + MessageBuilder.licenses.rawValue
        + String(item.licenseId)
        + MessageBuilder.messenger.rawValue
        + item.messengerType
        + MessageBuilder.chatId.rawValue
        + item.id
        + MessageBuilder.messages.rawValue
    }
    
    fileprivate func getProfile() -> String {
        API.url.rawValue + ProfileInfoURL.me.rawValue
    }
    
    fileprivate func getProfileInUserD(name: String, email: String, avatar: String) {
        user.saveFullName(name)
        user.saveEmail(email)
        user.saveAvatar(avatar)
    }
}
