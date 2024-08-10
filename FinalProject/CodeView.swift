//
//  CodeView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI
import Combine

struct CodeView: View {
    @Binding var contact: VerificationModel
    @FocusState private var isTextFieldFocused: Bool
    @State private var code = ""
    
    var body: some View {
        ZStack {
            TextField("", text: $code)
//                .foregroundStyle(.backgroundWB)
//                .tint(.backgroundWB)
                .keyboardType(.numberPad)
                .focused($isTextFieldFocused)
                .onAppear {
                    isTextFieldFocused = true
                    code = contact.code
                }
                .onReceive(Just(code)) { newValue in
                    let formatted = formatCode(newValue)
                    if code != formatted {
                        code = formatted
                        contact.code = formatted
                    }
                }
        }
    }
    
    func formatCode(_ number: String, count: Int = 4) -> String {
        let digits = number.filter { $0.isNumber }
        return String(digits.prefix(count))
    }
}

#Preview {
    CodeView(contact: .constant(VerificationModel()))
}
