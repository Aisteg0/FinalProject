//
//  ViewModel.swift
//  FinalProject
//
//  Created by Vladimir on 11.08.2024.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    @Published var network = Network()
    @Published var items = [DataItem]()
    @Published var datum = [Datum]()
    @Published var profile = PersonalInfo(id: 1, fullName: "", email: "", avatar: "", status: "", workday: "")
    
    private var token = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        getToken()
    }
    
    func getToken() {
        network.postNewToken(with: PersonalData.self) { [weak self] result in
            switch result {
            case .success(let token):
                self?.token = token
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
                self?.token = token
                print(token)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchAllItems() {
        network.getAllItems(with: token)
            .assign(to: \.items, on: self)
            .store(in: &self.cancellables)
    }
    
    func getDatum() {
        network.getLicenses(with: token)
            .assign(to: \.datum, on: self)
            .store(in: &self.cancellables)
    }
    
    func getProfile() {
        network.getInfoAboutAccount(with: token)
            .assign(to: \.profile, on: self)
            .store(in: &cancellables)
    }
}
