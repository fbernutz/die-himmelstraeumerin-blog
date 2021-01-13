//
//  Theme+ItemList.swift
//  
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Foundation
import Publish
import Plot
import ShellOut

extension Node where Context == HTML.BodyContext {
	static func itemList(for items: [Item<HimmelstraeumerinBlog>]) throws -> Node {
		let sketchnoteItems = items.filter { $0.sectionID == .sketchnotes }
		let postItems = items.filter { $0.sectionID == .posts }

		return .div(
			.if(postItems.count > 0,
				.ul(
					.class("grid posts"),
					.forEach(postItems) { item in
						.li(
							.class("item posts"),
							.blogPostItem(item)
						)
					}
				)
			),
			.if(sketchnoteItems.count > 0,
				.div(
					.class("sketchnotes"),
					try .forEach(sketchnoteItems) { item in
						try .sketchnoteItem(item)
					}
				)
			)
		)
	}
}

private extension Node where Context == HTML.BodyContext {
	static func blogPostItem(_ item: Item<HimmelstraeumerinBlog>) -> Self {
		return .article(
			.p(
				.class("release-date"),
				.text("\(item.date.formatted) ⋅ \(Int(item.readingTime.minutes.rounded())) min read")
			),
			.h1(
				.a(
					.href(item.path),
					.text(item.title)
				)
			),
			.p(.text(item.description))
		)
	}

	static func sketchnoteItem(_ item: Item<HimmelstraeumerinBlog>) throws -> Self {
		guard let imagePath = item.imagePath else {
			throw PublishingError(
				infoMessage: "🖼💥 Missing imagePath on: \(item.title)"
			)
		}

		return .article(
			.class("sketchnote-item"),
			.a(
				.href(item.path),
				.img(
					.class("sketchnote-image"),
					.src(imagePath),
					.alt(item.description)
				),
				.p(
					.class("sketchnote-title"),
					.text(item.title)
				)
			)
		)
	}
}
