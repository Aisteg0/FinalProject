//
//  VerificationNumberView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI
import Router

struct VerificationNumberView: View {
    @State var contact = VerificationModel()
    @EnvironmentObject var router: Router<AuthRoute>
    
    
    var body: some View {
        VStack {
            Text(NSLocalizedString("enterPhoneNumber", comment: ""))
                .font(.system(size: 24))
                .bold()
            Text(NSLocalizedString("willSendCode", comment: ""))
                .padding(.top, 8)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .frame(width: 293)
                .lineSpacing(8)
            VerificationEnterNumberView(contact: contact)
                .padding(.top, 49)
            Button {
                router.routeTo(.verificationCode)
            } label: {
                Text(NSLocalizedString("continue", comment: ""))
                    .font(.system(size: 16))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(30)
            }
            .padding(.top, 69)
            .padding(25)
        }
        .onTapGesture {
            self.endEditing(true)
        }
    }
}

#Preview {
    VerificationNumberView()
        .environmentObject(Router<AuthRoute>())
}
