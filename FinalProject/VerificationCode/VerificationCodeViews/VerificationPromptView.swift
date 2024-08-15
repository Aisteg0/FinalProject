//
//  VerificationPromptView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI

struct VerificationPromptView: View {
    @Binding var contact: String
    var numberOfCircles: Int
    
    var body: some View {
        HStack(spacing: Constants.spacing) {
            ForEach(0..<numberOfCircles, id: \.self) { id in
                if id < contact.count {
                    let index = contact.index(contact.startIndex, offsetBy: id)
                    CirclePromtView(digit: String(contact[index]))
                } else {
                    CirclePromtView(digit: "")
                }
            }
        }
    }
}

struct CirclePromtView: View {
    let digit: String
    
    var body: some View {
        ZStack {
            if digit == "" {
                Image(systemName: "circle.fill")
                    .font(.system(size: Constants.systemSize))
                    .foregroundStyle(.colorForPrompt)
            }
            Text(digit)
                .foregroundStyle(.colorForText)
                .font(.system(size: Constants.systemSize))
        }
        .frame(width: Constants.width, height: Constants.height)
    }
}

private enum Constants {
    static let spacing: CGFloat = 44.0
    static let systemSize: CGFloat = 32.0
    static let width: CGFloat = 44.0
    static let height: CGFloat = 44.0
}

#Preview {
    VerificationPromptView(contact: .constant(""), numberOfCircles: 4)
}
