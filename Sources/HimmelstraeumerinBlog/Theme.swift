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
        func makeIndexHTML(for index: Index,
                           context: PublishingContext<HimmelstraeumerinBlog>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: index, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .h1("Recent Sketchnotes"),
                        .itemList(
                            for: Array(
                                context.allItems(
                                    sortedBy: \.date,
                                    order: .descending
                                ).filter { $0.sectionID == .sketchnotes }
                                .prefix(4)
                            ),
                            on: context.site
                        ),
                        .h1("Recent Posts"),
                        .itemList(
                            for: Array(
                                context.allItems(
                                    sortedBy: \.date,
                                    order: .descending
                                ).filter { $0.sectionID == .posts }
                                .prefix(4)
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
                        .itemList(
                            for: Array(
                                context.allItems(
                                    sortedBy: \.date,
                                    order: .descending
                                ).filter { $0.sectionID == section.id }
                            ),
                            on: context.site)
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
                        .if(item.sectionID == .posts,
                            .article(
                                .p(.class("release-date"), .text("\(item.date.formatted) ⋅ \(Int(item.readingTime.minutes.rounded())) min read")),
                                .div(
                                    .class("content"),
                                    .contentBody(item.body)
                                ),
                                .span("Tagged with: "),
                                .tagList(for: item, on: context.site)
                            ),
                            else: .article(
                                .div(
                                    .class("content"),
                                    .contentBody(item.body),
                                    .p(
                                        .a(
                                            //TODO: ensure that a sketchnote item has an imagePath
                                            .href(item.imagePath?.absoluteString.originalImagePath ?? ""),
                                            .target(.blank),
                                            .img(
                                                .src(item.imagePath?.absoluteString.originalImagePath ?? ""),
                                                .alt(item.description)
                                            )
                                        )
                                    )
                                ),
                                .span("Tagged with: "),
                                .tagList(for: item, on: context.site)
                            )
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
