//
//  DateToString.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation
import Firebase

enum DateFormat: String {
    case date = "dd MMM yyyy"
    case dateTime = "dd MMM yyyy hh:mm"
}

extension Date {

    func toString(format: DateFormat = .date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }

    func toAge() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self, to: Date())
        let year = components.year!
        let month = components.month!

        var age = "\(month) bulan"

        if year > 0 {
            age = "\(year) tahun " + age
        }

        return age
    }
}
