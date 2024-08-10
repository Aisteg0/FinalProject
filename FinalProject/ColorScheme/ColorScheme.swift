//
//  ColorScheme.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct ColorScheme {
    let background: Color
    let foregroundColor: Color
    let buttonColor: Color
}

enum ColorSchemeType {
    case main
    case alternative
    
    private static let mainCs: ColorScheme = ColorScheme(
        background: Color.dynamic(light: "#F7F7FC", dark: "#190E26"),
        foregroundColor: Color.dynamic(light: "#ADB5BD", dark: "#F7F7FC"),
        buttonColor: Color.dynamic(light: "#9A41FE", dark: "#8207E8")
    )
    
    private static let altCs: ColorScheme = ColorScheme(
        background: Color.dynamic(light: "#9A41FE", dark: "#8207E8"),
        foregroundColor: Color.dynamic(light: "#9A41FE", dark: "#8207E8"),
        buttonColor: Color.dynamic(light: "#ADB5BD", dark: "#F7F7FC")
    )
    
    var colorScheme: ColorScheme {
        switch self {
        case .main:
            return ColorSchemeType.mainCs
        case .alternative:
            return ColorSchemeType.altCs
        }
    }
}
