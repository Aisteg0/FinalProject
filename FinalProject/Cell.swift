//
//  Cell.swift
//  FinalProject
//
//  Created by Михаил Ганин on 11.08.2024.
//

import SwiftUI

struct Cell: View {
    
    // MARK: Сюда надо нормальную модель подставить
    var dataItem: DataItemExample
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Image(dataItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: Constants.sizeForImage, height: Constants.sizeForImage)
                .clipShape(Circle())
                .padding(.leading, Constants.paddingForImage)
            
            VStack(alignment: .leading) {
                Text(dataItem.name)
                    .font(.headline)
                    .foregroundColor(colorScheme == .light ? Color.colorForNameLight : Color.colorForNameDark)
                if let unread = dataItem.lastMessage?.previewText {
                    Text("\(unread)")
                        .font(.subheadline)
                        .foregroundColor(Color.colorForUnread)
                        .padding(.top, Constants.paddingForUnread)
                }
            }
            
            Spacer()
            
            VStack {
                // MARK: Посмотреть как прихоядт даты и вставить ниже
                Text("17.05")
                    .foregroundColor(colorScheme == .light ? Color.colorForDateLight : Color.colorForDateDark)
                Spacer()
                if  let coutUnreadMessage = dataItem.unreadMessages  {
                    Circle()
                        .fill(colorScheme == .light ? Color.colorForCirleLigth : Color.colorForCirleDark)
                        .frame(width: Constants.frameWidhtForCountUnread, height: Constants.frameHeightForCountUnread)
                        .overlay(
                            Text("\(coutUnreadMessage)")
                                .font(.caption)
                                .foregroundColor(colorScheme == .light ? Color.colorForDateLight : Color.colorForDateDark)
                        )
                }
            }
        }
        .padding(.vertical, Constants.paddingForAllHStack)
        .frame(width: Constants.widhtForAllHStack, height: Constants.heightForAllHStack)
        .cornerRadius(Constants.cornerRadius)
//        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}


// MARK: Перенести в Extetshion+Color

extension Color {
    static let colorForCirleLigth = Color(red: 245/255, green: 236/255, blue: 255/255)
    static let colorForCirleDark = Color(red: 245/255, green: 236/255, blue: 255/255)
    static let colorForDateLight = Color(red: 164/255, green: 164/255, blue: 164/255)
    static let colorForDateDark = Color(red: 237/255, green: 237/255, blue: 237/255)
    static let colorForNameLight = Color(red: 41/255, green: 24/255, blue: 59/255)
    static let colorForNameDark = Color(red: 247/255, green: 247/255, blue: 252/255)
    static let colorForUnread = Color(red: 173/255, green: 181/255, blue: 189/255)
}

private enum Constants {
    static let sizeForImage: CGFloat = 56.0
    static let paddingForImage: CGFloat = 24.0
    static let paddingForUnread: CGFloat = 2.0
    static let frameWidhtForCountUnread: CGFloat = 21.0
    static let frameHeightForCountUnread: CGFloat = 20.0
    static let paddingForAllHStack: CGFloat = 8.0
    static let widhtForAllHStack: CGFloat = 327.0
    static let heightForAllHStack: CGFloat = 56.0
    static let cornerRadius: CGFloat = 8.0
}
