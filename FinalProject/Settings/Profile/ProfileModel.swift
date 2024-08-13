//
//  ProfileModel.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import Foundation

struct ProfileInfo: Hashable {
    var fullName: String
    var email: String
    var avatar: String
}

//class PersonalInfo: ObservableObject {
//    var network: Network = .init()
//    @Published var fullName: String = ""
//    @Published var email: String = ""
//    @Published var avatar: String = ""
//    
//    func getInfo(user: any AuthManagerProtocol) {
//        network.getInfoAboutAccount(with: "feb17911df8f6f6308a99d109f90d7e82dd151e05075a441de332635e659e503")
//        fullName = user.getFullName() ?? ""
//        email = user.getEmail() ?? ""
//        avatar = user.getAvatar() ?? ""
//    }
//}
