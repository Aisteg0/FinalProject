//
//  Trash.swift
//  FinalProject
//
//  Created by Vladimir on 10.08.2024.
//

import Foundation

//private func getURLRequest() -> URLRequest {
    //            var request = URLRequest(url: URL(string: "https://random-data-api.com/api/v2/users")!)
    //            request.httpMethod = "GET"
    //            return request
    //        }
    //
    //        // Perform network call
    //        private func fetchSomeData() {
    //            let result: AnyPublisher<ProfileInfo, Error> = fetch(T##url: URL##URL)
    //            isFetchingData = true
    //
    //            result.sink { _ in
    //            } receiveValue: { item in
    //                print(item)
    //                self.users.append(item)
    //                isFetchingData = false
    //                fetchSomeData() // Fetch new data when request has completed
    //            }
    //            .store(in: &cancellables) // Stores a type-erasing cancellable instance.
    //        }
    
//    func fetchProfile(with token: String, and: ) {
//        guard let url = URL(string: API.url.rawValue + ProfileInfoURL.me.rawValue) else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue(token, forHTTPHeaderField: "Authorization")
//        request.setValue("ru", forHTTPHeaderField: "Lang")
//        
//        let result: AnyPublisher<ProfileInfo, Error> = fetch(request)
//            .sink { _ in
//            } receiveValue: { profile in
//                <#code#>
//            }
//
//        
//    }

//        let queryItems = [
//            URLQueryItem(name: "companyId", value: "personal"),
//            URLQueryItem(name: "filter[search][field]", value: "name"),
//            URLQueryItem(name: "filter[search][query]", value: "Hello"),
//            URLQueryItem(name: "filter[licenseIds]", value: "537,535"),
//            URLQueryItem(name: "filter[messengerTypes]", value: "WhatsApp"),
//            URLQueryItem(name: "filter[responsibleIds]", value: "null,237,235"),
//            URLQueryItem(name: "filter[producerIds]", value: "null,237,235"),
//            URLQueryItem(name: "filter[accompliceIds]", value: "null,237,235"),
//            URLQueryItem(name: "filter[auditorIds]", value: "null,237,235"),
//            URLQueryItem(name: "filter[status]", value: "null"),
//            URLQueryItem(name: "filter[unreadMessages]", value: "0"),
//            URLQueryItem(name: "filter[tagIds]", value: "null,537,535"),
//            URLQueryItem(name: "filter[levelIds]", value: "null,123,555"),
//            URLQueryItem(name: "filter[pin]", value: "0"),
//            URLQueryItem(name: "lastTime", value: "1627887999"),
//            URLQueryItem(name: "lastInternalId", value: "568756"),
//            URLQueryItem(name: "limit", value: "20")
//        ]

//        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
//            urlComponents.queryItems = queryItems
//            request.url = urlComponents.url
//        }
