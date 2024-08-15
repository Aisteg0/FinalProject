//
//  NotificationView.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 12.08.2024.
//

import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    var body: some View {
        Group {
            FakeNotification()
                .offset(x: Constants.offsetX1, y: viewModel.letsGo ? Constants.offsetY1 : 0)
                .animation(.interpolatingSpring(stiffness: Constants.stiffness, damping: Constants.damping), value: viewModel.letsGo)
        }
        .onAppear {
            viewModel.letsGoToggle()
        }
        .task {
            await goAway()
        }
    }
    
    private func goAway() async {
        try? await Task.sleep(nanoseconds: Constants.nanoseconds)
        viewModel.letsGo = false
    }
}

struct FakeNotification: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(Constants.cornerRadius)
                .foregroundColor(.gray)
                .opacity(Constants.opacity)
            HStack {
                Image(systemName: "globe")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: Constants.width1, height: Constants.height1)
                    .padding(.leading, Constants.padding1)
                    .padding(.horizontal, Constants.padding2)
                Text("Your verification code: \(viewModel.password)")
                    .font(.system(size: Constants.systemSize))
            }
        }
        .frame(width: Constants.width2, height: Constants.height2)
        .offset(x: Constants.offsetX2, y: Constants.offsetY2)
        .onDisappear {
            print("Notification is disappeared")
        }
    }
}

private enum Constants {
    static let offsetX1: CGFloat = 0.0
    static let offsetY1: CGFloat = 250.0
    static let stiffness: CGFloat = 15.0
    static let damping: CGFloat = 4.0
    static let nanoseconds: UInt64 = 10_000_000_000
    static let cornerRadius: CGFloat = 15.0
    static let opacity: CGFloat = 0.4
    static let width1: CGFloat = 30.0
    static let height1: CGFloat = 30.0
    static let width2: CGFloat = 350.0
    static let height2: CGFloat = 60.0
    static let padding1: CGFloat = -20.0
    static let padding2: CGFloat = 5.0
    static let systemSize: CGFloat = 20.0
    static let offsetX2: CGFloat = 0.0
    static let offsetY2: CGFloat = -490.0
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .environmentObject(ChatViewModel())
    }
}

