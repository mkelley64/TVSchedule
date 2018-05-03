//
//  TimeFormatUtil.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

extension Date {
    func tvMazeDateString() -> String {
        return DateFormatter.tvMazeDateTimeFormatter.string(from: self)
    }
}

extension DateFormatter {
    fileprivate static let tvMazeDateTimeFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
