//
//  Theme+Head.swift
//  
//
//  Created by Feli Be on 22.09.21.
//

import Publish
import Plot

extension Node where Context == HTML.DocumentContext {

	static func head<T: Website>(
		for location: Location,
		on site: T,
		titleSeparator: String = " | ",
		stylesheetPaths: [Path] = ["/styles.css"],
		rssFeedPath: Path? = .defaultForRSSFeed,
		rssFeedTitle: String? = nil
	) -> Node {
		var title = location.title

		if title.isEmpty {
			title = site.name
		} else {
			title.append(titleSeparator + site.name)
		}

		var description = location.description

		if description.isEmpty {
			description = site.description
		}

		return .head(
			.encoding(.utf8),
			.siteName(site.name),
			.url(site.url(for: location)),
			.title(title),
			.description(description),
			.twitterCardType(location.imagePath == nil ? .summary : .summaryLargeImage),
			.forEach(stylesheetPaths, { .stylesheet($0) }),
			.viewport(.accordingToDevice),
			.unwrap(site.favicon, { .favicon($0) }),
			.unwrap(rssFeedPath, { path in
				let title = rssFeedTitle ?? "Subscribe to \(site.name)"
				return .rssFeedLink(path.absoluteString, title: title)
			}),
			.unwrap(location.imagePath ?? site.imagePath, { path in
				let url = site.url(for: path)
				return .socialImageLink(url)
			}),
			.theme()
		)
	}
}
