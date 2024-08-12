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
    @State private var phoneNumber = ""
    
    var body: some View {
        HStack(spacing: 8) {
            Text("🇷🇺 +7")
            TextField("", text: $phoneNumber, prompt: Text("000 000-00-00"))
                .padding(8)
                .font(.system(size: 14))
                .bold()
                .frame(width: 262, height: 36)
                .keyboardType(.numberPad)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white)
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
    
    func formatPhoneNumber(_ number: String) -> String {
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

#Preview {
    VerificationEnterNumberView(contact: VerificationModel())
}
