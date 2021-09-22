//
//  Theme+Meta.swift
//  
//
//  Created by Feli Be on 22.09.21.
//

import Publish
import Plot

extension Node where Context == HTML.HeadContext {
	/// Add meta tag to add a theme color, mostly for Safari 15
	static func theme() -> Node {
		return .meta(.name("theme-color"), .content("#284081"))
	}
}
