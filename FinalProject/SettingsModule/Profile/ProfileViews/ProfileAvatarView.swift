//
//  ProfileAvatarView.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI

struct ProfileAvatarView: View {
    let profile: PersonalInfo
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: profile.avatar)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                } else {
                    Image("person")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .frame(width: 112, height: 112)
                        .clipShape(Circle())
                }
            }
        }
        .frame(width: 200, height: 200)
        .background {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(Color(red: RGBColor(247), green: RGBColor(247), blue: RGBColor(252)))
        }
    }
}

extension ProfileAvatarView {
    func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

#Preview {
    ProfileAvatarView(profile: PersonalInfo(id: 111, fullName: "Test test", email: "123@gmail.com", avatar: "https://flomaster.top/o/uploads/posts/2024-02/1708364185_flomaster-top-p-smeshariki-pingvin-instagram-narisovannie-15.jpg", status: "", workday: ""))
}
