//
//  VerificationCodeView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI
import Router

struct VerificationCodeView: View {
    @State var contact = VerificationModel()
    @EnvironmentObject var router: Router<AuthRoute>
    
    var body: some View {
        VStack {
            Text(NSLocalizedString("enterCode", comment: ""))
                .font(.system(size: 24))
                .bold()
//                .foregroundStyle(.mainTextWB)
            Text(NSLocalizedString("sentCode", comment: ""))
                .padding(.top, 8)
                .font(.system(size: 14))
//                .foregroundStyle(.mainTextWB)
            Text("+7 999 999-99-99")
                .padding(.top, 2)
                .font(.system(size: 14))
//                .foregroundStyle(.mainTextWB)
            VerificationPromptView(contact: $contact.code, numberOfCircles: 4)
                .padding(.top, 49)
            CodeView(contact: $contact)
            Button {
                
            } label: {
                Text(NSLocalizedString("requestCodeAgain", comment: ""))
                    .font(.system(size: 16))
//                    .foregroundStyle(.pinkTextWB)
                    .padding()
            }
            .padding(.top, 69)
            .padding(25)
        }
    }
}

#Preview {
    VerificationCodeView()
}

