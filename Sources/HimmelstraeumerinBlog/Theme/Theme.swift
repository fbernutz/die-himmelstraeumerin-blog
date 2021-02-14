//
//  Theme.swift
//  
//
//  Created by Felizia Bernutz on 31.12.19.
//

import Publish
import Plot

extension Theme where Site == HimmelstraeumerinBlog {
	static var himmelstraeumerin: Self {
		Theme(
			htmlFactory: HimmelstraeumerinHTMLFactory()
		)
	}

	private struct HimmelstraeumerinHTMLFactory: HTMLFactory {
		func makeIndexHTML(for index: Index, context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
			HTML(
				.lang(context.site.language),
				.head(for: index, on: context.site),
				.body(
					.header(for: context, selectedSection: nil),
					.wrapper(
						.div(
							.class("recents"),
							.h1("Recent Sketchnotes"),
							try .itemList(
								for: Array(
									context.allItems(
										sortedBy: \.date,
										order: .descending
									).filter { $0.sectionID == .sketchnotes }
										.prefix(3)
								)
							),
							.h1("Recent Posts"),
							try .itemList(
								for: Array(
									context.allItems(
										sortedBy: \.date,
										order: .descending
									).filter { $0.sectionID == .posts }
										.prefix(3)
								)
							)
						)
					),
					.footer(for: context.site)
				)
			)
		}

		func makeSectionHTML(for section: Section<HimmelstraeumerinBlog>, context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
			let items = Array(
				context.allItems(
					sortedBy: \.date,
					order: .descending
				).filter { $0.sectionID == section.id }
			)

			let sectionContent: Node<HTML.BodyContext>
			switch section.id {
			case .sketchnotes,
				 .posts:
				sectionContent = .wrapper(
					.h1(.text(section.title)),
					try! .itemList(
						for: items
					)
				)
			case .ios:
				let iOSPosts = Array(
					context.allItems(
						sortedBy: \.date,
						order: .descending
					).filter { $0.sectionID == .posts }
				).filter { $0.tags.contains("iOS") }

				sectionContent = .wrapper(
					.h1(.text("iOS Posts")),
					try! .itemList(
						for: iOSPosts
					)
				)
			case .about:
				sectionContent = .wrapper(
					.article(
						section.content.body.node
					)
				)
			}

			return HTML(
				.lang(context.site.language),
				.head(for: section, on: context.site),
				.body(
					.header(for: context, selectedSection: section.id),
					sectionContent,
					.footer(for: context.site)
				)
			)
		}

		func makeItemHTML(for item: Item<HimmelstraeumerinBlog>, context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
			HTML(
				.lang(context.site.language),
				.head(for: item, on: context.site),
				.body(
					.class("item-page"),
					.header(for: context, selectedSection: item.sectionID),
					.wrapper(
						.itemDetail(for: item, on: context.site)
					),
					.footer(for: context.site)
				)
			)
		}

		func makePageHTML(for page: Page, context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
			HTML(
				.lang(context.site.language),
				.head(for: page, on: context.site),
				.body(
					.header(for: context, selectedSection: nil),
					.wrapper(

					),
					.footer(for: context.site)
				)
			)
		}

		func makeTagListHTML(for page: TagListPage, context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML? {
			HTML(
				.lang(context.site.language),
				.head(for: page, on: context.site),
				.body(
					.header(for: context, selectedSection: nil),
					.wrapper(
						.h1("Browse all tags"),
						.ul(
							.class("all-tags"),
							.forEach(page.tags.sorted()) { tag in
								.li(
									.class("tag"),
									.a(
										.href(context.site.path(for: tag)),
										.text(tag.string)
									)
								)
							}
						)
					),
					.footer(for: context.site)
				)
			)
		}

		func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML? {
			HTML(
				.lang(context.site.language),
				.head(for: page, on: context.site),
				.body(
					.header(for: context, selectedSection: nil),
					.wrapper(
						.h1(
							"Tagged with ",
							.span(
								.class("tag"),
								.text(page.tag.string)
							)
						),
						.a(
							.class("browse-all"),
							.text("Browse all tags"),
							.href(context.site.tagListPath)
						),
						try .itemList(
							for: context.items(
								taggedWith: page.tag,
								sortedBy: \.date,
								order: .descending
							)
						)
					),
					.footer(for: context.site)
				)
			)
		}
	}
}
