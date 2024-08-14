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
        MenuItem(icon: Keys.Images.theme, title: Keys.Settings.theme),
        MenuItem(icon: Keys.Images.notifications, title: Keys.Settings.notifications),
        MenuItem(icon: Keys.Images.safety, title: Keys.Settings.safety),
        MenuItem(icon: Keys.Images.inviteFriend, title: Keys.Settings.inviteFriend)
    ]
    
    var body: some View {
        VStack {
            ProfileRow(profile: $profile) {
                router.routeTo(.profile(profile))
            }
            
            ForEach(menuItems) { item in
                MenuRow(item: item) {
                    switch item.title {
                    case Keys.Settings.theme: router.routeTo(.theme)
                    case Keys.Settings.notifications: router.routeTo(.notifications)
                    case Keys.Settings.safety: router.routeTo(.safety)
                    case Keys.Settings.inviteFriend: router.routeTo(.inviteFriend)
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
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    router.dismiss()
                } label: {
                    HStack {
                        Image(systemName: Keys.Images.backButton)
                        Text(Keys.Settings.settings)
                            .foregroundStyle(.black)
                    }
                    .bold()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    router.routeTo(.settings)
                } label: {
                    Image(systemName: "gearshape")
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
