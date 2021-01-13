//
//  Theme+ItemDetail.swift
//  
//
//  Created by Felizia Bernutz on 26.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
	static func itemDetail(for item: Item<HimmelstraeumerinBlog>, on site: HimmelstraeumerinBlog) -> Node {
		switch item.sectionID {
		case .posts:
			return .article(
				.blogPostDetail(item),
				.div(
					.class("tags"),
					.span("Tagged with: "),
					.tagList(for: item, on: site)
				)
			)
		case .sketchnotes:
			return .article(
				.sketchnoteDetail(item),
				.div(
					.class("tags"),
					.span("Tagged with: "),
					.tagList(for: item, on: site)
				)
			)
		case .about:
			return .article(
				.cvDetail(item)
			)
		}
	}
}

private extension Node where Context == HTML.BodyContext {
	static func blogPostDetail(_ item: Item<HimmelstraeumerinBlog>) -> Self {
		let blogMetadata = item.date.formatted
			+ " ⋅ "
			+ "\(Int(item.readingTime.minutes.rounded()))"
			+ " min read"

		return .div(
			.class("content post-detail"),
			.p(
				.class("release-date"),
				.text(blogMetadata)
			),
			.contentBody(item.body)
		)
	}

	static func sketchnoteDetail(_ item: Item<HimmelstraeumerinBlog>) -> Self {
		return .div(
			.class("content sketchnote-detail"),
			.contentBody(item.body),
			.metaData(for: item),
			.sketchnoteOriginal(for: item)
		)
	}

	static func sketchnoteOriginal(for item: Item<HimmelstraeumerinBlog>) -> Self {
		return .p(
			.class("sketchnote-detail-image"),
			.unwrap(item.imagePath) {
				.a(
					.href($0.absoluteString.originalImagePath),
					.target(.blank),
					.img(
						.src($0.absoluteString.originalImagePath),
						.alt(item.description)
					)
				)
			}
		)
	}

	static func metaData(for item: Item<HimmelstraeumerinBlog>) -> Self {
		let contentByDescription = "Content by"
		return .div(
			.class("metadata"),
			.unwrap(item.metadata.contentCreator) { contentCreator in
				.if(item.metadata.linkToContentCreator != nil,
					.p(
						.text(contentByDescription),
						.a(
							.href(item.metadata.linkToContentCreator ?? ""),
							.text(contentCreator),
							.target(.blank),
							.rel(.noreferrer)
						)
					), else:
					.p(
						.text("\(contentByDescription) \(contentCreator)")
					)
				)
			},
			.p(
				.text("Sketch by"),
				.a(
					.href("https://twitter.com/felibe444"),
					.text("@felibe444"),
					.target(.blank),
					.rel(.noreferrer)
				)
			),
			.p(
				.text("Created on \(item.date.formatted)")
			)
		)
	}

	static func cvDetail(_ item: Item<HimmelstraeumerinBlog>) -> Self {
		.div(
			.class("content about"),
			.contentBody(item.body)
		)
	}

}
