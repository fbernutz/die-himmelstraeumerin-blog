//
//  Theme+ItemList.swift
//  
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func itemList(for items: [Item<HimmelstraeumerinBlog>], on site: HimmelstraeumerinBlog) -> Node {
        let sketchnoteItems = items.filter { $0.sectionID == .sketchnotes }
        let postItems = items.filter { $0.sectionID == .posts }

        return .div(
            .if(postItems.count > 0,
                .ul(
                    .class("item-list grid posts"),
                    .forEach(postItems) { item in
                        .li(
                            .blogPostItem(item)
                        )
                    }
                )
            ),
            .if(sketchnoteItems.count > 0,
                .ul(
                    .class("item-list grid sketchnotes"),
                    .forEach(sketchnoteItems) { item in
                        .li(
                            .sketchnoteItem(item)
                        )
                    }
                )
            )
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func blogPostItem(_ item: Item<HimmelstraeumerinBlog>) -> Self {
        return .article(
            .p(.class("release-date"),
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

    static func sketchnoteItem(_ item: Item<HimmelstraeumerinBlog>) -> Self {
        return .article(
            .if(item.imagePath != nil,
                .a(
                    .href(item.path),
                    .img(.src(item.imagePath!))
                ),
                //TODO: ensure that a sketchnote item has an imagePath
                else: .a(
                    .href(item.path),
                    .text(item.title)
                )
            )
        )
    }
}
