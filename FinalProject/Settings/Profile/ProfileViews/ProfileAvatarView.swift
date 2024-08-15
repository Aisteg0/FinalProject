//
//  ProfileAvatarView.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//
import Foundation
import SwiftUI
import Combine
import ExyteChat

struct ProfileAvatarView: View {
    let avatar: String
    let side: CGFloat
    var body: some View {
        VStack {
            CachedAsyncImage(url: URL(string: avatar)) { phase in
                phase
                    .resizable()
                    .frame(width: side, height: side)
                    .clipShape(Circle())
            } placeholder: {
                Image(Keys.Images.person)
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: side * 0.56, height: side * 0.56)
                    .clipShape(Circle())
            }
        }
        .frame(width: side, height: side)
        .background {
            Circle()
                .frame(width: side, height: side)
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
    ProfileAvatarView(avatar: "https://flomaster.top/o/uploads/posts/2024-02/1708364185_flomaster-top-p-smeshariki-pingvin-instagram-narisovannie-15.jpg", side: 200)
}
