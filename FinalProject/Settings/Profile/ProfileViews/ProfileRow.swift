//
//  ProfileRow.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI
import Router

struct ProfileRow: View {
    @Binding var profile: ProfileInfo
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                ProfileAvatarView(avatar: profile.avatar, side: 56)
                VStack(alignment: .leading) {
                    Text(profile.fullName)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Text(profile.email)
                        .font(.system(size: 16))
                }
                .padding(.leading, 8)
                .foregroundStyle(.colorForText)
                Spacer()
                Image(systemName: Keys.Images.nextButton)
                    .foregroundStyle(.colorForText)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }
}
