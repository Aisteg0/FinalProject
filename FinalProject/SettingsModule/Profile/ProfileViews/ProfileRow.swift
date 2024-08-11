//
//  ProfileRow.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI
import Router

struct ProfileRow: View {
    let profile: PersonalInfo
    
    var body: some View {
        HStack {
            ProfileAvatarView(avatar: profile.avatar, side: 56)
            VStack(alignment: .leading) {
                Text(profile.fullName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color(red: 0.23, green: 0.19, blue: 0.35)) // Цвет текста имени

                Text(profile.email)
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
            }
            .padding(.leading, 8)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(Color(red: 0.23, green: 0.19, blue: 0.35)) // Цвет стрелки
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

#Preview {
    ProfileRow(profile: PersonalInfo(id: 111, fullName: "Test test", email: "123@gmail.com", avatar: "https://flomaster.top/o/uploads/posts/2024-02/1708364185_flomaster-top-p-smeshariki-pingvin-instagram-narisovannie-15.jpg", status: "", workday: ""))
}
