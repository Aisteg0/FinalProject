//
//  TextView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("number")
            .font(.title)
            .bold()
            .padding(.top, Constants.padding)
        Text("code_confirmation")
            .multilineTextAlignment(.center)
            .padding(.top, Constants.padding2)
    }
}

private enum Constants {
    static let padding: CGFloat = 169.0
    static let padding2: CGFloat = 8.0
}

#Preview {
    TextView()
}
