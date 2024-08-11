//
//  ContentView.swift
//  FinalProject
//
//  Created by Михаил Ганин on 09.08.2024.
//

import SwiftUI

struct Notification: View {
    @State var letsGo = false
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    ForEach(0..<25) { text in
                        Button {
                            letsGo.toggle()
                        } label: {
                            Rectangle().frame(height: 40)
                                .foregroundColor(.green)
                        }
                    }
                }
                .navigationTitle("Hello world")
            }
            Group {
                FakeNotification()
                    .offset(x: 0, y: letsGo ? 100 : 0)
                    .animation(.interpolatingSpring(stiffness: 15, damping: 4), value: letsGo)
            }
            .task {
                await goAway()
            }
                
        }
    }
    
    private func goAway() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 7_000_000_000)
            letsGo = false
        }
}

struct FakeNotification: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(.gray)
                .opacity(0.4)
            HStack {
                Image(systemName: "globe")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, -20)
                    .padding(.horizontal, 5)
                Text("Your verification code: \(getRandomCode())")
                    .font(.system(size: 20))
            }
        }
        .frame(width: 350, height: 60)
        .offset(x: 0, y: -460)
        .onDisappear {
            print("Notification is disappeared")
        }
    }
    

    
    private func getRandomCode() -> String { // функция должна где-то еще сохранять код, чтобы сымитировать верификацию пользователя
        var code: String = ""
        
        for _ in 0..<4 {
            code += String(Int.random(in: 1...9))
        }
        return code
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
