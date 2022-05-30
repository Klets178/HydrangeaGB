//
//  DateFormatter+Extension.swift
//  HydrangeaGB
//
//  Created by KKK on 25.05.2022.
//

import Foundation

extension DateFormatter {
    static func setDateFormat(date: Date = Date()) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}
