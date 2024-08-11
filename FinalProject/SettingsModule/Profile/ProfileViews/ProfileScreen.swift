//
//  ProfileScreen.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI
import Router

struct ProfileScreen: View {
    let profile: PersonalInfo
    @EnvironmentObject var router: Router<MainRoute>
    
    
    var body: some View {
            VStack(spacing: 60) {
                ProfileAvatarView(avatar: profile.avatar, side: 200)
                    .padding(.top, 80)
                ProfileView(profile: profile)
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
                            Text("Контакты")
                                .foregroundColor(.black)
                        }
                        .bold()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "pencil")
                        .bold()
                }
            }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileScreen(profile: PersonalInfo(id: 111, fullName: "Test test", email: "123@gmail.com", avatar: "https://flomaster.top/o/uploads/posts/2024-02/1708364185_flomaster-top-p-smeshariki-pingvin-instagram-narisovannie-15.jpg", status: "", workday: ""))
}
