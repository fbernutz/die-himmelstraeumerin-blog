//
//  String+Path.swift
//  
//
//  Created by Felizia Bernutz on 24.03.20.
//

import Foundation

extension String {
    var resolvedRelativePath: String {
       replacingOccurrences(of: "/../..", with: "Resources")
    }

    var originalImagePath: String {
        replacingOccurrences(of: "-small", with: "")
    }
}
