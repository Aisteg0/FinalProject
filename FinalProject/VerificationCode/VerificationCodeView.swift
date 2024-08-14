//
//  VerificationCodeView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI
import Router
import UISystem
import StorageModule

struct VerificationCodeView: View {
    @State var showAlert = false
    @State var contact = VerificationModel()
    @EnvironmentObject var router: Router<AuthRoute>
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var viewModel: ChatViewModel
    var phoneNumber: String
    
    var body: some View {
        ZStack {
            Color.accent4
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VerificationTextView(mainText: "enterCode", additionalText: "sentCode", textColor: .colorForText)
                Text(Constants.countryCode + phoneNumber)
                    .padding(.top, Constants.padding1)
                    .font(.system(size: Constants.systemSize1))
                    .foregroundStyle(.colorForText)
                VerificationPromptView(contact: $contact.code, numberOfCircles: Constants.numberOfCircles)
                    .padding(.top, Constants.padding2)
                CodeView(contact: $contact, checkCode: checkCode)
                Button {
                    viewModel.getRandomCode()
                } label: {
                    Text(NSLocalizedString("requestCodeAgain", comment: ""))
                        .font(.system(size: Constants.systemSize2))
                        .foregroundStyle(.accent5)
                        .padding()
                }
                .padding(.top, Constants.padding3)
                .padding(Constants.padding4)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(NSLocalizedString("incorrectCode", comment: "")),
                    dismissButton: .default(Text(NSLocalizedString("ok", comment: "")))
                )
            }
            NotificationView()
        }
    }
    
    private func checkCode() {
        if contact.code == viewModel.password {
            router.path.removeLast(router.path.count)
            authManager.authorizeUser()
        } else {
            showAlert.toggle()
        }
    }
    
}

private enum Constants {
    static let countryCode: String = "+7 "
    static let padding1: CGFloat = 2.0
    static let padding2: CGFloat = 49.0
    static let padding3: CGFloat = 69.0
    static let padding4: CGFloat = 25.0
    static let systemSize1: CGFloat = 14.0
    static let systemSize2: CGFloat = 16.0
    static let numberOfCircles: Int = 4
}

#Preview {
    VerificationCodeView(showAlert: true, contact: VerificationModel(), phoneNumber: "800 555 35 35")
        .environmentObject(ChatViewModel())
}

