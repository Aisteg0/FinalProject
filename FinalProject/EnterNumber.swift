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
    @StateObject var colorSchemeState = ColorSchemeState()

    var body: some View {
        HStack {
            TextField(" 🇷🇺 +7", text: $countryCod)
                .frame(width: Constants.width, height: Constants.height)
                .background(colorSchemeState.current.background)
                .foregroundColor(colorSchemeState.current.foregroundColor)
                .disabled(true)
            TextField("  000 000-00-00", text: $phoneNumber)
                .keyboardType(.phonePad)
                .frame(width: Constants.width2, height: Constants.height2)
                .background(colorSchemeState.current.background)
                .foregroundColor(colorSchemeState.current.foregroundColor)
        }
        .padding(.top, Constants.padding)
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
