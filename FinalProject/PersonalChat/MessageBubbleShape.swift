//
//  MessageBubbleShape.swift
//  FinalProject
//
//  Created by Ильяс Жанаев on 14.08.2024.
//

import SwiftUI

struct MessageBubbleShape: Shape {
    enum Direction {
        case left
        case right
    }
    
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }
    
    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: Constants.twentyFive, y: height))
            p.addLine(to: CGPoint(x: width - CGFloat.twenty, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - CGFloat.twenty),
                       control1: CGPoint(x: width - CGFloat.eight, y: height),
                       control2: CGPoint(x: width, y: height - CGFloat.eight))
            p.addLine(to: CGPoint(x: width, y: CGFloat.twenty))
            p.addCurve(to: CGPoint(x: width - CGFloat.twenty, y: CGFloat.zero),
                       control1: CGPoint(x: width, y: CGFloat.eight),
                       control2: CGPoint(x: width - CGFloat.eight, y: CGFloat.zero))
            p.addLine(to: CGPoint(x: Constants.twentyOne, y: CGFloat.zero))
            p.addCurve(to: CGPoint(x: CGFloat.four, y: CGFloat.twenty),
                       control1: CGPoint(x: CGFloat.twelve, y: CGFloat.zero),
                       control2: CGPoint(x: CGFloat.four, y: CGFloat.eight))
            p.addLine(to: CGPoint(x: CGFloat.four, y: height))

           
            
            
        }
        return path
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: Constants.twentyFive, y: height))
            p.addLine(to: CGPoint(x:  CGFloat.twenty, y: height))
            p.addCurve(to: CGPoint(x: CGFloat.zero, y: height - CGFloat.twenty),
                       control1: CGPoint(x: CGFloat.eight, y: height),
                       control2: CGPoint(x: CGFloat.zero, y: height - CGFloat.eight))
            p.addLine(to: CGPoint(x: CGFloat.zero, y: CGFloat.twenty))
            p.addCurve(to: CGPoint(x: CGFloat.twenty, y: CGFloat.zero),
                       control1: CGPoint(x: CGFloat.zero, y: CGFloat.eight),
                       control2: CGPoint(x: CGFloat.eight, y: CGFloat.zero))
            p.addLine(to: CGPoint(x: width - Constants.twentyOne, y: CGFloat.zero))
            p.addCurve(to: CGPoint(x: width - CGFloat.two, y: CGFloat.twenty),
                       control1: CGPoint(x: width - CGFloat.twelve, y: CGFloat.zero),
                       control2: CGPoint(x: width - CGFloat.four, y: CGFloat.eight))
            p.addLine(to: CGPoint(x: width - CGFloat.two, y: height))
        }
        return path
    }
}

struct MessageBubbleShape_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleShape(direction: .left)
            .frame(width: 200, height: 100)
    }
}

private enum Constants {
    static let twentyFive: CGFloat = 25.0
    static let twentyOne: CGFloat = 21.0
}
