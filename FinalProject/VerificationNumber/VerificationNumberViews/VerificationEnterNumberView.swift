//
//  VerificationEnterNumberView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI
import Combine

struct VerificationEnterNumberView: View {
    
    @State var contact: VerificationModel
    @Binding var phoneNumber: String
    
    var body: some View {
        HStack(spacing: Constants.spacing) {
            Text("🇷🇺 +7")
                .frame(width: Constants.width, height: Constants.height)
                .font(.system(size: Constants.systemSize))
                .bold()
                .background(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(Color.accent3))
                .foregroundStyle(.accent1)
            TextField("", text: $phoneNumber, prompt: Text("000 000-00-00"))
                .padding(Constants.padding1)
                .font(.system(size: Constants.systemSize))
                .bold()
                .frame(width: Constants.width2, height: Constants.height2)
                .keyboardType(.numberPad)
                .background(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(Color.accent3)
                )
                .onReceive(Just(phoneNumber)) { newValue in
                    let formatted = formatPhoneNumber(newValue)
                    if phoneNumber != formatted {
                        phoneNumber = formatted
                        contact.phoneNumber = formatted
                    }
                }
        }
    }
    
    private func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }
        
        let mask = "XXX XXX-XX-XX"
        var result = ""
        var index = digits.startIndex
        
        for ch in mask where index < digits.endIndex {
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
}

private enum Constants {
    static let spacing: CGFloat = 8.0
    static let systemSize: CGFloat = 14.0
    static let padding1: CGFloat = 8.0
    static let width: CGFloat = 62.0
    static let height: CGFloat = 36.0
    static let width2: CGFloat = 262.0
    static let height2: CGFloat = 36.0
    static let cornerRadius: CGFloat = 4.0
}

#Preview {
    VerificationEnterNumberView(contact: VerificationModel(), phoneNumber: .constant(""))
}
