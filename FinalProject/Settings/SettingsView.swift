//
//  SettingsView.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI
import Router

struct SettingsView: View {
    @EnvironmentObject var router: Router<MainRoute>
    @EnvironmentObject var authManager: AuthManager
    var network: Network = .init()
    @State private var profile: ProfileInfo = ProfileInfo(fullName: "", email: "", avatar: "")
    
    let menuItems: [MenuItem] = [
        MenuItem(icon: "sun.max", title: "Тема"),
        MenuItem(icon: "bell", title: "Уведомления"),
        MenuItem(icon: "shield", title: "Безопасность"),
        MenuItem(icon: "envelope", title: "Пригласи друга")
    ]
    
    var body: some View {
        VStack {
            ProfileRow(profile: $profile) {
                router.routeTo(.profile(profile: profile))
            }
            
            ForEach(menuItems) { item in
                MenuRow(item: item) {
                    switch item.title {
                    case "Тема": router.routeTo(.theme)
                    case "Уведомления": router.routeTo(.notifications)
                    case "Безопасность": router.routeTo(.safety)
                    case "Пригласи друга": router.routeTo(.inviteFriend)
                    default: break
                    }
                }
                .foregroundStyle(.black)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Настройки")
                            .foregroundStyle(.black)
                    }
                    .bold()
                }
            }
        }
        .onAppear {
            guard profile.fullName.isEmpty else { return }
            loadProfileInfo()
        }
        .navigationBarBackButtonHidden()
    }
    
    private func loadProfileInfo() {
        DispatchQueue.global().async {
            network.getInfoAboutAccount(with: "feb17911df8f6f6308a99d109f90d7e82dd151e05075a441de332635e659e503")
        }
        profile = ProfileInfo(
            fullName: authManager.getFullName() ?? "username",
            email: authManager.getEmail() ?? "",
            avatar: authManager.getAvatar() ?? ""
        )
    }
}

#Preview {
    SettingsView()
        .environmentObject(Router<MainRoute>())
        .environmentObject(AuthManager(storageManager: StorageManager()))
}
