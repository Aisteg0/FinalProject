//
//  SettingsView.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI
import Router

struct SettingsView: View {
    let profile: PersonalInfo = .init(id: 111,
                                      fullName: "Test test",
                                      email: "123@gmail.com",
                                      avatar: "https://flomaster.top/o/uploads/posts/2024-02/1708364185_flomaster-top-p-smeshariki-pingvin-instagram-narisovannie-15.jpg",
                                      status: "",
                                      workday: "")
    
    @EnvironmentObject var router: Router<MainRoute>
    var body: some View {
        VStack {
            Button {
                router.routeTo(.profile(profile: profile))
            } label: {
                ProfileRow(profile: profile)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Настройки")
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
    SettingsView()
        .environmentObject(Router<MainRoute>())
}
