//
//  Cell.swift
//  FinalProject
//
//  Created by Михаил Ганин on 11.08.2024.
//

import SwiftUI
import Models
import ExyteChat

struct Cell: View {
    
    var dataItem: DataItem
    
    var body: some View {
        HStack {
            CachedAsyncImage(url: URL(string: dataItem.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Constants.sizeForImage, height: Constants.sizeForImage)
                    .clipShape(Circle())
                    .padding(.leading, Constants.paddingForImage)
            } placeholder: {
                WaitingAnimation()
            }
            
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
                Text("\(intToDate(dataItem.lastTime))")
                    .foregroundColor(.colorForDate)
                Spacer()
                if let coutUnreadMessage = dataItem.unreadMessages  {
                    Group {
                        Circle()
                            .fill(.colorForCircle)
                            .frame(width: Constants.frameWidhtForCountUnread, height: Constants.frameHeightForCountUnread)
                            .overlay(
                                Text("\(coutUnreadMessage)")
                                    .font(.caption)
                                    .foregroundColor(.colorForDate)
                            )
                    }
                    .opacity(coutUnreadMessage == 0 ? 0 : 1)
                }
            }
        }
        .padding(.vertical, Constants.paddingForAllHStack)
        .padding(.trailing, Constants.padding1)
        .cornerRadius(Constants.cornerRadius)
    }
    
    private func intToDate (_ value: Int?) -> String {
        guard let value else { return "" }
        let date = Date(timeIntervalSince1970: TimeInterval(value))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
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
    static let padding1: CGFloat = 15.0
}
