//
//  File.swift
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
        func makeIndexHTML(for index: Index,
                           context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: index, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .h1("Latest content"),
                        .itemList(
                            for: Array(
                                context.allItems(
                                    sortedBy: \.date,
                                    order: .descending
                                ).prefix(6)
                            ),
                            on: context.site
                        )
                    ),
                    .footer(for: context.site)
                )
            )
        }

        func makeSectionHTML(for section: Section<HimmelstraeumerinBlog>,
                             context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: section, on: context.site),
                .body(
                    .header(for: context, selectedSection: section.id),
                    .wrapper(
                        .h1(.text(section.title)),
                        .itemList(for: section.items, on: context.site)
                    ),
                    .footer(for: context.site)
                )
            )
        }

        func makeItemHTML(for item: Item<HimmelstraeumerinBlog>,
                          context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: item, on: context.site),
                .body(
                    .class("item-page"),
                    .header(for: context, selectedSection: item.sectionID),
                    .wrapper(
                        .article(
                            .div(
                                .class("content"),
                                .contentBody(item.body)
                            ),
                            .span("Tagged with: "),
                            .tagList(for: item, on: context.site)
                        )
                    ),
                    .footer(for: context.site)
                )
            )
        }

        func makePageHTML(for page: Page,
                          context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
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

        func makeTagListHTML(for page: TagListPage,
                             context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML? {
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

        func makeTagDetailsHTML(for page: TagDetailsPage,
                                context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML? {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .h1(
                            "Tagged with ",
                            .span(.class("tag"), .text(page.tag.string))
                        ),
                        .a(
                            .class("browse-all"),
                            .text("Browse all tags"),
                            .href(context.site.tagListPath)
                        ),
                        .itemList(
                            for: context.items(
                                taggedWith: page.tag,
                                sortedBy: \.date,
                                order: .descending
                            ),
                            on: context.site
                        )
                    ),
                    .footer(for: context.site)
                )
            )
        }
    }
}

private extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }

    static func header<T: Website>(
        for context: PublishingContext<T>,
        selectedSection: T.SectionID?
    ) -> Node {
        return .header(
            .wrapper(
                .a(.class("site-name"), .href("/"), .text(context.site.name)),
                .p(.text(context.site.description))
            )
        )
    }

    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .p(.class("release-date"), .text("\(item.date.formatted)")),
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                        )),
                    .p(.text(item.description))
                    ))
            }
        )
    }

    static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
        return .ul(.class("tag-list"), .forEach(item.tags) { tag in
            .li(.a(
                .href(site.path(for: tag)),
                .text(tag.string)
                ))
            })
    }

    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Made by Felizia Bernutz using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish"),
                    .target(.blank)
                ),
                .text(". This site is "),
                .a(
                    .text("open source"),
                    .href("https://github.com/fbernutz/fbernutz.github.io"),
                    .target(.blank)
                ),
                .text(".")
            ),
            .p(
                .a(
                    .text("Twitter"),
                    .href("https://twitter.com/felibe444"),
                    .target(.blank)
                ),
                .text(" | "),
                .a(
                    .text("GitHub"),
                    .href("https://github.com/fbernutz"),
                    .target(.blank)
                ),
                .text(" | "),
                .a(
                    .text("Instagram"),
                    .href("https://www.instagram.com/diehimmelstraeumerin/"),
                    .target(.blank),
                    .rel(.nofollow)
                ),
                .text(" | "),
                .a(
                    .text("Flickr"),
                    .href("https://www.flickr.com/photos/feli_93/"),
                    .target(.blank)
                )
            )
        )
    }
}
