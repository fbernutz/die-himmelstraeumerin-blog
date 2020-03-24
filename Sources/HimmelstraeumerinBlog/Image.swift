//
//  Image.swift
//  
//
//  Created by Felizia Bernutz on 24.03.20.
//

import Foundation

struct Image {
    let width: Int
    let height: Int

    // e.g. 125x500
    init(with dimension: String) {
        let components = dimension.components(separatedBy: "x")
        width = Int(components[0])!
        height = Int(components[1])!
    }
}
