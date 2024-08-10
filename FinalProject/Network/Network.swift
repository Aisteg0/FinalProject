//
//  RealNetwork.swift
//  FinalProject
//
//  Created by Vladimir on 09.08.2024.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class Network: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    
    // Генерирует токен и в completion его возвращает (лучше реализовать метод в начале запуска приложения , лушче всего в init() классе)
    func getToken(with personalData: PersonalData.Type, _ completion: @escaping(Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: API.url.rawValue + Token.getToken.rawValue) else {
            return completion(.failure(.invalidURL))
            
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        
        let json = [
            "email": personalData.email.rawValue,
            "password": personalData.password.rawValue,
            "appId": personalData.appid.rawValue
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: [])
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
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
    
    // Заново генерирует токен, если предыдущий перестал работать, в completion его возвращает (лучше реализовать метод в начале запуска приложения , лушче всего в init() классе)
    func refreshToken(_ completion: @escaping(Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: API.url.rawValue + Token.refreshToken.rawValue) else {
            return completion(.failure(.invalidURL))
            
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
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
                    print(refreshToken)
                    completion(.success(refreshToken))
                }
            }
            .store(in: &cancellables)
    }
    
    // Возвращает массив чатов, с полной информацией о них, для того, чтобы далее использовать инфу для отправки сообщения
    func getLicenses(with token: String) -> AnyPublisher<[Datum], Never>  {
        guard let url = URL(string: API.url.rawValue + Chats.licenses.rawValue) else {
                return  Just([Datum]()).eraseToAnyPublisher()
                }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("ru", forHTTPHeaderField: "Lang")
        
                return fetch(request)
                .map { (response: LicensesModel) -> [Datum] in
                    return response.data
                    }
                    .replaceError(with: [Datum]())
                    .eraseToAnyPublisher()
    }
    
    // Возвращает массив объектов, по моделе: AllItemsModel
    func fetchAllItems(with token: String) -> AnyPublisher<[DataItem], Never> {
        guard let url = URL(string: API.url.rawValue + Chats.allChats.rawValue) else {
            return  Just([DataItem]()).eraseToAnyPublisher()
        }
        print(url)
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
    
    
        
        // Функция для загрузки картинки
        func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
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
        
        // Эту функицю я написал для себя? чтобы упросить дальнейшие get-запросы
    func fetch<T: Decodable>(_ url: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .print()
            .eraseToAnyPublisher()
    }
}
