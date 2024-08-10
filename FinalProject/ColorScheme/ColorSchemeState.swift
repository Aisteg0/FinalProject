//
//  ColorSchemeState.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

final class ColorSchemeState: ObservableObject {
    @Published private var currentColorSchemeType = ColorSchemeType.main
    var current: ColorScheme {
        return currentColorSchemeType.colorScheme
    }

    func updateColorScheme(to colorSchemeType: ColorSchemeType) {
        self.currentColorSchemeType = colorSchemeType
    }
}
