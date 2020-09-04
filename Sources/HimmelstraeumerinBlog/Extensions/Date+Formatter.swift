//
//  Date+Formatter.swift
//  
//
//  Created by Felizia Bernutz on 31.12.19.
//

import Foundation

extension Date {
	/// outputs "Nov 10, 2018"
	var formatted: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .none
		dateFormatter.locale = Locale(identifier: "en_US")
		return dateFormatter.string(from: self)
	}
}
