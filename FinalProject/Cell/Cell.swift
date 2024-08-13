//
//  Cell.swift
//  FinalProject
//
//  Created by Михаил Ганин on 11.08.2024.
//

import SwiftUI
import Models

struct Cell: View {
    
    var dataItem: DataItem
    
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
                    .foregroundColor(.colorForName)
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
                    .foregroundColor(.colorForDate)
                Spacer()
                if  let coutUnreadMessage = dataItem.unreadMessages  {
                    Circle()
                        .fill(.colorForCircle)
                        .frame(width: Constants.frameWidhtForCountUnread, height: Constants.frameHeightForCountUnread)
                        .overlay(
                            Text("\(coutUnreadMessage)")
                                .font(.caption)
                                .foregroundColor(.colorForDate)
                        )
                }
            }
        }
        .padding(.vertical, Constants.paddingForAllHStack)
        .frame(width: Constants.widhtForAllHStack, height: Constants.heightForAllHStack)
        .cornerRadius(Constants.cornerRadius)
        //        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
//    private func intToDate (_ value: Int) -> Date {
//        
//    }
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
