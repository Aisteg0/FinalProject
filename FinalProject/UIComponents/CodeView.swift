//
//  CodeView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 10.08.2024.
//

import SwiftUI
import Combine
import Router

struct CodeView: View {
    @Binding var contact: VerificationModel
    @FocusState private var isTextFieldFocused: Bool
    let checkCode: () -> Void
    
    var body: some View {
        ZStack {
            TextField("", text: $contact.code)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .keyboardType(.numberPad)
                .focused($isTextFieldFocused)
                .onAppear {
                    isTextFieldFocused = true
                }
                .onChange(of: contact.code) { newValue in
                    if newValue.count > 4 {
                        contact.code = String(newValue.prefix(4))
                    }
                    if newValue.count == 4 {
                        checkCode()
                    }
                }
        }
    }
}

#Preview {
    CodeView(contact: .constant(VerificationModel()), checkCode: {})
}
