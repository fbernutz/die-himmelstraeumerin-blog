//
//  Theme+Header.swift
//  
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
	static func header(
		for context: PublishingContext<HimmelstraeumerinBlog>,
		selectedSection: HimmelstraeumerinBlog.SectionID?
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
	static func siteName(for context: PublishingContext<HimmelstraeumerinBlog>) -> Self {
		.a(
			.class("site-name"),
			.href("/"),
			.text("#DieHimmels&shy;traeumerin")
		)
	}

	static func siteDescription(for context: PublishingContext<HimmelstraeumerinBlog>) -> Self {
		.p(
			.text(context.site.description)
		)
	}

	static func navigation(for context: PublishingContext<HimmelstraeumerinBlog>, selectedSection: HimmelstraeumerinBlog.SectionID?) -> Self {
		let sectionIDs = HimmelstraeumerinBlog.SectionID.allCases
			.filter { $0 != .iOS } // do not show "iOS" in navigation

		return .nav(
			.ul(
				.forEach(sectionIDs) { section in
					.li(
						.a(
							.class(section == selectedSection ? "selected" : ""),
							.href(context.sections[section].path),
							.text(context.sections[section].id == .about ? "About" : context.sections[section].title)
						)
					)
				}
			)
		)
	}
}
