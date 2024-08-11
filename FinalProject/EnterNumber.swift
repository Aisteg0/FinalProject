//
//  EnterNumber.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct EnterNumber: View {
    @State private var countryCod = ""
    @State private var phoneNumber = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if countryCod.isEmpty {
                    Text(" 🇷🇺 +7")
                        .frame(width: Constants.width, height: Constants.height)
                        .background(colorScheme == .light ? Color.accentLight3 : Color.accentDark3)
                        .foregroundColor(colorScheme == .light ? Color.accentLight1 : Color.accentDark1)
                }
            }
            
            TextField("", text: $phoneNumber)
                .placeholder(when: phoneNumber.isEmpty, placeholder: {
                    Text(" 000 00-00-00").foregroundColor(colorScheme == .light ? Color.accentLight1 : Color.accentDark1)
                })
                .keyboardType(.phonePad)
                .frame(width: Constants.width2, height: Constants.height2)
                .background(colorScheme == .light ? Color.accentLight3 : Color.accentDark3)
                .foregroundColor(colorScheme == .light ? Color.accentLight1 : Color.accentDark1)
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

private enum Constants {
    static let width: CGFloat = 62.0
    static let height: CGFloat = 36.0
    static let width2: CGFloat = 262.0
    static let height2: CGFloat = 36.0
    static let padding: CGFloat = 49.0
}

#Preview {
    EnterNumber()
}
