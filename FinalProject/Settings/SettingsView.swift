//
//  SettingsView.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 11.08.2024.
//

import SwiftUI
import Router

struct SettingsView: View {
    @EnvironmentObject var router: Router<MainRoute>
    var network: Network = .init()
    /*тестоый юзер*/
    let profile: PersonalInfo = .init(id: 111,
                                      fullName: "Test test",
                                      email: "123@gmail.com",
                                      avatar: "https://flomaster.top/o/uploads/posts/2024-02/1708364185_flomaster-top-p-smeshariki-pingvin-instagram-narisovannie-15.jpg",
                                      status: "",
                                      workday: "")
    let menuItems: [MenuItem] = [
        MenuItem(icon: "sun.max", title: "Тема"),
        MenuItem(icon: "bell", title: "Уведомления"),
        MenuItem(icon: "shield", title: "Безопасность"),
        MenuItem(icon: "envelope", title: "Пригласи друга")
    ]
    
    var body: some View {
        VStack {
            Button(action: {
                router.routeTo(.profile(profile: profile))
            }) {
                ProfileRow(profile: profile)
            }
            
            ForEach(menuItems) { item in
                MenuRow(item: item) {
                    //router.routeTo()
                }
                .foregroundStyle(.black) //цвет текста
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Настройки")
                            .foregroundStyle(.black) //цвет текста
                    }
                    .bold()
                }
            }
        }
        .onAppear {
            //network.getInfoAboutAccount(with: ) //токен, не понял от куда его доставать
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SettingsView()
        .environmentObject(Router<MainRoute>())
}
