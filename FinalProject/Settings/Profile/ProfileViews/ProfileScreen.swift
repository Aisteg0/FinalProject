//
//  ProfileScreen.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI
import Router

struct ProfileScreen: View {
    var profile: ProfileInfo
    @EnvironmentObject var router: Router<MainRoute>
    
    var body: some View {
            VStack(spacing: 60) {
                ProfileAvatarView(avatar: profile.avatar, side: 200)
                    .padding(.top, 80)
                ProfileView(fullName: profile.fullName, email: profile.email)
                SocialNetworkView()
                    .padding(.top, -20)
                Spacer()
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text(Keys.Profile.profile)
                                .foregroundColor(.black)
                        }
                        .bold()
                    }
                }
            }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileScreen(profile: ProfileInfo(fullName: "123", email: "321@mail.ru", avatar: ""))
}
