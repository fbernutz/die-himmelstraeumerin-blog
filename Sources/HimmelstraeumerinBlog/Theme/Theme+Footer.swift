//
//  Theme+Footer.swift
//  
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
	static func footer<T: Website>(for site: T) -> Node {
		return .footer(
			.p(
				.text("Made by Felizia Bernutz using "),
				.linkToPublish,
				.text(". This site is "),
				.linkToOpenSourceRepo,
				.text(".")
			),
			.p(
				.linkToTwitter,
				.separator,
				.linkToGithub,
				.separator,
				.linkToInstagram,
				.separator,
				.linkToBuyMeACoffee,
				.separator,
				.linkToRSSFeed
			)
		)
	}
}

private extension Node where Context == HTML.BodyContext {
	static let separator: Self = .text(" | ")

	static let linkToPublish: Self =
		.a(
			.text("Publish"),
			.href("https://github.com/johnsundell/publish"),
			.target(.blank),
			.rel(.noreferrer)
	)

	static let linkToOpenSourceRepo: Self =
		.a(
			.text("open source"),
			.href("https://github.com/fbernutz/die-himmelstraeumerin-blog"),
			.target(.blank),
			.rel(.noreferrer)
	)

	static let linkToTwitter: Self =
		.a(
			.text("Twitter 🐦"),
			.href("https://twitter.com/felibe444"),
			.target(.blank),
			.rel(.noreferrer)
	)

	static let linkToGithub: Self =
		.a(
			.text("GitHub 👩‍💻"),
			.href("https://github.com/fbernutz"),
			.target(.blank),
			.rel(.noreferrer)
	)

	static let linkToInstagram: Self =
		.a(
			.text("Instagram (🔒)"),
			.href("https://www.instagram.com/diehimmelstraeumerin/"),
			.target(.blank),
			.rel(.noreferrer)
	)

	static let linkToBuyMeACoffee: Self =
		.a(
			.text("Buy me a hot chocolate ☕️"),
			.href("https://www.buymeacoffee.com/felibe444"),
			.target(.blank),
			.rel(.noreferrer)
	)

	static let linkToRSSFeed: Self =
		.a(
			.text("RSS Feed 🗞"),
			.href("https://fbernutz.github.io/feed.rss")
	)
}
