//
//  ButtonNext.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct ButtonNext: View {
    
    @State var action: () -> Void
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: action, label: {
            Text("next")
        })
        .frame(width: Constants.width, height: Constants.height)
        .background(Color.accent2)
        .cornerRadius(Constants.cornerRadius)
        .foregroundColor(.white)
        .padding(.top, Constants.paddingForButton)
    }
}

private enum Constants {
    static let width: CGFloat = 327.0
    static let height: CGFloat = 52.0
    static let cornerRadius: CGFloat = 45.0
    static let paddingForButton: CGFloat = 69.0
}
