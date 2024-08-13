//
//  Sequence+.swift
//  FinalProject
//
//  Created by Vladimir on 13.08.2024.
//

import Foundation
import Algorithms

public extension Sequence where [Element]: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return self.filter { seen.insert($0).inserted }
    }
}
