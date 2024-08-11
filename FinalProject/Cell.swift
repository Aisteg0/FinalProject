//
//  Cell.swift
//  FinalProject
//
//  Created by Михаил Ганин on 11.08.2024.
//

import SwiftUI

struct Cell: View {
    var dataItem: DataItemExample
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Image(dataItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 56, height: 56)
                .clipShape(Circle())
                .padding(.leading, 24)
            
            VStack(alignment: .leading) {
                Text(dataItem.name)
                    .font(.headline)
                
                if let unread = dataItem.lastMessage?.previewText {
                    Text("\(unread)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            VStack {
                if  let coutUnreadMessage = dataItem.unreadMessages  {
                    Text("17.05")
                    Circle()
                        .fill(colorScheme == .light ? Color.colorForCirleLigth : Color.colorForCirleDark)
                        .frame(width: 21, height: 20)
                        .overlay(
                            Text("\(coutUnreadMessage)")
                                .font(.caption)
                                .foregroundColor(Color.black)
                        )
                }
            }
            .frame(width: 55)
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: 327, height: 56)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}


// MARK: Перенести в Extetshion+Color

extension Color {
    static let colorForCirleLigth = Color(red: 245/255, green: 236/255, blue: 255/255)
    static let colorForCirleDark = Color(red: 245/255, green: 236/255, blue: 255/255)
}
