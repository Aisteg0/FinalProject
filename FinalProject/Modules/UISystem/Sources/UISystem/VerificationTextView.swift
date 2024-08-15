//
//  VerificationTextView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 13.08.2024.
//

import SwiftUI

public struct VerificationTextView: View {
    
    public var mainText: String
    public var additionalText: String
    public var textColor: Color
    
    public init(mainText: String, additionalText: String, textColor: Color) {
        self.mainText = mainText
        self.additionalText = additionalText
        self.textColor = textColor
    }
    
    public var body: some View {
        VStack {
            Text(NSLocalizedString(mainText, comment: ""))
                .font(.system(size: Constants.systemSize1))
                .bold()
                .foregroundColor(textColor)
            Text(NSLocalizedString(additionalText, comment: ""))
                .padding(.top, Constants.padding)
                .font(.system(size: Constants.systemSize2))
                .multilineTextAlignment(.center)
                .lineSpacing(Constants.lineSpacing)
                .foregroundColor(textColor)
        }
    }
}

private enum Constants {
    static let systemSize1: CGFloat = 24.0
    static let systemSize2: CGFloat = 14.0
    static let padding: CGFloat = 8.0
    static let lineSpacing: CGFloat = 8.0
}
