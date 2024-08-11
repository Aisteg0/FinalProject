//
//  TextView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct TextView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Text("number")
            .font(.title)
            .bold()
            .padding(.top, Constants.padding)
            .foregroundColor(colorScheme == .light ? Color.colorForTextLight : Color.colorForTextDark)
        Text("code_confirmation")
            .multilineTextAlignment(.center)
            .padding(.top, Constants.padding2)
            .foregroundColor(colorScheme == .light ? Color.colorForTextLight : Color.colorForTextDark)
    }
}

private enum Constants {
    static let padding: CGFloat = 169.0
    static let padding2: CGFloat = 8.0
}

#Preview {
    TextView()
}
