//
//  VerificationNumberView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI
import Router
import NetworkModule
import UISystem

struct VerificationNumberView: View {
    @State var contact = VerificationModel()
    @EnvironmentObject var router: Router<AuthRoute>
    @EnvironmentObject var viewModel: ChatViewModel
    @StateObject var network = Network()
    @State private var phoneNumber = ""
    
    var body: some View {
        ZStack {
            Color.accent4
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.endEditing(true)
                }
            
            VStack {
                VerificationTextView(mainText: "enterPhoneNumber", additionalText: "willSendCode", textColor: .colorForText)
                VerificationEnterNumberView(contact: contact, phoneNumber: $phoneNumber)
                    .padding(.top, Constants.padding1)
                Button {
                    router.routeTo(.verificationCode(phoneNumber: phoneNumber))
                    viewModel.letsGoToggle()
                } label: {
                    Text(NSLocalizedString("continue", comment: ""))
                        .frame(width: Constants.width, height: Constants.height)
                        .background(.accent2)
                        .cornerRadius(Constants.cornerRadius)
                        .foregroundColor(.white)
                        .padding(.top, Constants.paddingForButton)
                }
                .disabled(phoneNumber.count < Constants.countPhoneNumber)
                .opacity(phoneNumber.count < Constants.countPhoneNumber ? Constants.opacity1 : Constants.opacity2)
                .padding(.top, Constants.padding2)
                .padding(Constants.padding3)
                WaitingAnimation()
            }
        }
    }
}

private enum Constants {
    static let width: CGFloat = 327.0
    static let height: CGFloat = 52.0
    static let cornerRadius: CGFloat = 45.0
    static let paddingForButton: CGFloat = 69.0
    static let padding1: CGFloat = 49.0
    static let padding2: CGFloat = 40.0
    static let padding3: CGFloat = 25.0
    static let countPhoneNumber: Int = 13
    static let opacity1: CGFloat = 0.5
    static let opacity2: CGFloat = 1.0
}

#Preview {
    VerificationNumberView()
        .environmentObject(Router<AuthRoute>())
}
