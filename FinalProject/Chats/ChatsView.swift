//
//  ChatsView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import SwiftUI
import NetworkModule
import Router

struct ChatsView: View {
    
    @EnvironmentObject var router: Router<MainRoute>
    @EnvironmentObject var viewModel: ChatViewModel
    
    
    var body: some View {
        
        VStack {
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
        .onAppear() {
            viewModel.getAllItems()
//            viewModel.getMessages(from: item)
//            viewModel.sortedItems()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    router.routeTo(.settings)
                } label: {
                    Image(systemName: "gearshape")
                }
                
            }
        }
    }
}

#Preview {
    ChatsView()
        .environmentObject(ChatViewModel())
        .environmentObject(Router<MainRoute>())
}
