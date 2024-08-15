//
//  CustomInputTextInChatView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import SwiftUI
import Models
import ExyteChat
import ExyteMediaPicker

struct CustomInputTextInChatView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    @Binding var message: String
    let actions: (InputViewAction) -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Button {
                    actions(.photo)
                } label: {
                    Image("plus")
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                }
                TextField("Text", text: $message)
                    .font(.system(size: 14))
                    .frame(width: 279, height: 35)
                    .cornerRadius(4)
                    .background {
                        Color(.accent3)
                    }
                    .padding(.horizontal, 10)
                
                Button {
                    actions(.send)
                } label: {
                    Image("sendMessage")
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .padding(.bottom, 20)
    }
}
