//
//  Theme+Tags.swift
//  
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
	static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
		return .ul(
			.class("tag-list"),
			.forEach(item.tags) { tag in
				.li(
					.class("tag"),
					.a(
						.href(site.path(for: tag)),
						.text(tag.string)
					)
				)
			}
		)
	}
}
