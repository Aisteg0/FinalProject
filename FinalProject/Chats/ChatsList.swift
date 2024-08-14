//
//  ChatsView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import SwiftUI
import NetworkModule
import Router

struct ChatsList: View {
    
    @EnvironmentObject var router: Router<MainRoute>
    @EnvironmentObject var viewModel: ChatViewModel
    
    
    var body: some View {
        ZStack {
            Color.accent4
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("chats")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    Button {
                        router.routeTo(.settings)
                    } label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.colorForText)
                            .font(.system(size: 20))
                    }
                }
                .padding()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.items, id: \.id) { item in
                            Button(action: {
                                router.routeTo(.personalChat(item))
                                
                                viewModel.getMessages(from: item)
                                
                            }) {
                                Cell(dataItem: item)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onAppear {
                        viewModel.getAllItems()
                    }
                }
            }
        }
        .onAppear() {
            viewModel.getAllItems()
            //            viewModel.getMessages(from: item)
            //            viewModel.sortedItems()
        }
    }
}

#Preview {
    ChatsList()
        .environmentObject(ChatViewModel())
        .environmentObject(Router<MainRoute>())
}
