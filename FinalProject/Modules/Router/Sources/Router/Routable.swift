//
//  File.swift
//
//
//  Created by Сергей Дятлов on 09.08.2024.
//

import SwiftUI

public enum NavigationType {
    case push
    case sheet
    case fullScreenCover
}

public protocol Routable: Hashable, Identifiable {
    associatedtype ViewType: View
    var navigationType: NavigationType { get }
    @ViewBuilder func view(router: Router<Self>) -> ViewType
}

extension Routable {
    public var id: Self { self }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

