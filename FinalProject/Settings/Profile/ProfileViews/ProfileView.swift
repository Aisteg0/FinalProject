//
//  ProfileView.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI

struct ProfileView: View {
    var fullName: String
    var email: String
    var body: some View {
        VStack {
            Text(fullName)
                .font(.system(size: 24))
            Text(email)
                .font(.system(size: 16))
        }
        .foregroundStyle(.colorForText)
    }
}

extension ProfileView {
    private func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

//#Preview {
//    ProfileView(profile: PersonalInfo(id: 111, fullName: "Test test", email: "123@gmail.com", avatar: "https://flomaster.top/o/uploads/posts/2024-02/1708364185_flomaster-top-p-smeshariki-pingvin-instagram-narisovannie-15.jpg", status: "", workday: ""))
//}
