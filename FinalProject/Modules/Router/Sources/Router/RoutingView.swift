//
//  File.swift
//
//
//  Created by Сергей Дятлов on 09.08.2024.
//

import SwiftUI

public struct RoutingView<Content: View, Destination: Routable>: View {
    @StateObject var router = Router<Destination>()
    private let rootContent: () -> Content
    
    public init(_ routeType: Destination.Type, @ViewBuilder content: @escaping () -> Content) {
        self.rootContent = content
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            rootContent()
                .navigationDestination(for: Destination.self) { route in
                    route.view(router: router)
                }
        }
        .sheet(item: $router.presentingSheet) { route in
            route.view(router: router)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { route in
            route.view(router: router)
        }
        .environmentObject(router)
    }
}

