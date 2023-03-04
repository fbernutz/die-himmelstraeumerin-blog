//
//  Theme+Wrapper.swift
//  
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
	static func wrapper(_ nodes: Node...) -> Node {
		.div(
			.class("wrapper"),
			.group(nodes)
		)
	}
}
