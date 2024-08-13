//
//  Date+.swift
//  FinalProject
//
//  Created by Vladimir on 13.08.2024.
//

import Foundation

public extension Date {
    func startOfDay() -> Date {
        Calendar.current.startOfDay(for: self)
    }
    
    func isSameDay(_ date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    static func minusMinusTT (lhs: Int, rhs: Date) -> TimeInterval {
        rhs.timeIntervalSinceReferenceDate - TimeInterval(lhs)
//        return lhs.tim - rhs.timeIntervalSinceReferenceDate
    }
}
