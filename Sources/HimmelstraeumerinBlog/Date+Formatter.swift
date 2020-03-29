//
//  File.swift
//  
//
//  Created by Felizia Bernutz on 31.12.19.
//

import Foundation

extension Date {
    /// outputs "10. Nov 2018"
    var formatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
    }
}
