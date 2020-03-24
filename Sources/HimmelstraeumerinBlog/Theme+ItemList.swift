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
    static func itemList(for items: [Item<HimmelstraeumerinBlog>], on site: HimmelstraeumerinBlog) -> Node {
        let sketchnoteItems = items.filter { $0.sectionID == .sketchnotes }
        let postItems = items.filter { $0.sectionID == .posts }

        return .div(
            .if(postItems.count > 0,
                .ul(
                    .class("item-list grid posts"),
                    .forEach(postItems) { item in
                        .li(
                            .class("item-list-item posts"),
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
                            .class("item-list-item sketchnotes"),
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

    static func sketchnoteItem(_ item: Item<HimmelstraeumerinBlog>) -> Self {
        //TODO: ensure that a sketchnote item has an imagePath
        let imagePath = item.imagePath!.absoluteString
        let absolutePath = imagePath.replacingOccurrences(of: "/../..", with: "Resources")

        let imageDimension = try! shellOut(to: .identifyImageDimension(imagePath: absolutePath))
        let image = Image(with: imageDimension)

        return .article(
            .a(
                .class("sketchnote-item"),
                .href(item.path),
                .div(
                    .style("""
                        width:{{\(image.width)*200/\(image.height)}}px;
                        flex-grow:{{\(image.width)*200/\(image.height)}}
                        """),
                    .img(.src(item.imagePath!))
                )
            )
        )
    }
}
