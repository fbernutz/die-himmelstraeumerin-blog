//
//  ShellOutCommand+ImageDimension.swift
//  
//
//  Created by Felizia Bernutz on 24.03.20.
//

import ShellOut

extension ShellOutCommand {
    /// Identify Image Dimension of image in path
    static func identifyImageDimension(imagePath: String) -> ShellOutCommand {
        return ShellOutCommand(string: "identify -format \"%wx%h\" \(imagePath)")
    }
}
