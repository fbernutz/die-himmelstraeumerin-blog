//
//  Theme+Header.swift
//  
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
	static func header<T: Website>(
		for context: PublishingContext<T>,
		selectedSection: T.SectionID?
	) -> Node {
		.header(
			.wrapper(
				.siteName(for: context),
				.siteDescription(for: context),
				.navigation(for: context, selectedSection: selectedSection)
			)
		)
	}
}

private extension Node where Context == HTML.BodyContext {
	static func siteName<T: Website>(for context: PublishingContext<T>) -> Self {
		.a(
			.class("site-name"),
			.href("/"),
			.text(context.site.name)
		)
	}

	static func siteDescription<T: Website>(for context: PublishingContext<T>) -> Self {
		.p(
			.text(context.site.description)
		)
	}

	static func navigation<T: Website>(for context: PublishingContext<T>, selectedSection: T.SectionID?) -> Self {
		let sectionIDs = T.SectionID.allCases

		return .nav(
			.ul(
				.forEach(sectionIDs) { section in
					.li(
						.a(
							.class(section == selectedSection ? "selected" : ""),
							.href(context.sections[section].path),
							.text(context.sections[section].title)
						)
					)
				}
			)
		)
	}
}
