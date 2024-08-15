//
//  StringExtension.swift
//  FinalProject
//
//  Created by Сергей Дятлов on 14.08.2024.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
