//
//  String+Path.swift
//  
//
//  Created by Felizia Bernutz on 24.03.20.
//

import Foundation

extension String {
	var originalImagePath: String {
		replacingOccurrences(of: "-small", with: "")
	}
}
