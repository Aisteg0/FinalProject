//
//  ViewModelTest.swift
//  FinalProject
//
//  Created by Vladimir on 10.08.2024.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    @Published var network = Network()
    @Published var items = [DataItem]()
    @Published var datum = [Datum]()
    
    private var token = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        refreshToken()
    }
    
    func getToken() {
        network.getToken(with: PersonalData.self) { [weak self] result in
            switch result {
            case .success(let token):
                self?.token = token
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func refreshToken() {
        network.refreshToken { [weak self] result in
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
        network.fetchAllItems(with: token)
            .assign(to: \.items, on: self)
            .store(in: &self.cancellables)
    }
    
    func getDatum() {
        network.getLicenses(with: token)
            .assign(to: \.datum, on: self)
            .store(in: &self.cancellables)
    }
    
}
