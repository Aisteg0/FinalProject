//
//  MenuRow.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 12.08.2024.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}

struct MenuRow: View {
    let item: MenuItem
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: item.icon)
                    .foregroundColor(.primary)
                    .padding(.trailing, 10)
                Text(item.title)
                    .font(.system(size: 18, weight: .medium))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black)
            }
            .padding(.vertical, 15)
            .padding(.horizontal)
        }
    }
}
