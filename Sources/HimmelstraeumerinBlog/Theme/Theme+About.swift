//
//  Theme+About.swift
//  
//
//  Created by Felizia Bernutz on 10.01.21.
//

import Foundation
import Publish
import Plot
import ShellOut

extension Node where Context == HTML.BodyContext {
	static func about(for item: Content) -> Node {
		.article(
			.class("about"),
			item.body.node
		)
	}
}
