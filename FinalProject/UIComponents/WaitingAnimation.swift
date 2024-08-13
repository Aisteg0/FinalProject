//
//  Animation.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct WaitingAnimation: View {
    @State private var rotation: Double = Constants.degrees0
    
    var body: some View {
        Image(systemName: "arrow.2.circlepath")
            .font(.system(size: Constants.size))
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    rotation = Constants.degrees360
                }
            }
    }
}

private enum Constants {
    static let size: CGFloat = 50.0
    static let degrees360: CGFloat = 360.0
    static let degrees0: CGFloat = 0.0
}

#Preview {
    WaitingAnimation()
}
