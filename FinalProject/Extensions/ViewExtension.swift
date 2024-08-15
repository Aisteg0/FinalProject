//
//  ViewExtension.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 10.08.2024.
//

import SwiftUI

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
