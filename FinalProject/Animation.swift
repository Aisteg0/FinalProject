//
//  Animation.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct Animation: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.size, height: Constants.size)
                .rotationEffect(Angle(degrees: isAnimating ? Constants.degress360 : Constants.degrees0))
                .animation(.easeInOut(duration: Constants.duration).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
        }
    }
}

private enum Constants {
    static let size: CGFloat = 50.0
    static let duration: CGFloat = 0.8
    static let degress360: CGFloat = 360.0
    static let degrees0: CGFloat = 0.0
}

#Preview {
    Animation()
}
