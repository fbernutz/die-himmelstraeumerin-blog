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
                    .class("grid posts"),
                    .forEach(postItems) { item in
                        .li(
                            .class("item posts"),
                            .blogPostItem(item)
                        )
                    }
                )
            ),
            .if(sketchnoteItems.count > 0,
                .ul(
                    .class("grid sketchnotes"),
                    .forEach(sketchnoteItems) { item in
                        .li(
                            .class("item sketchnotes"),
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
        let calculatedWidth = Double(image.width) * 200 / Double(image.height)
        let calculatedPaddingBottom = Double(image.height) / Double(image.width) * 100

        return .article(
            .a(
                .href(item.path),
                .img(
                    .src(item.imagePath!),
                    //TODO: add alt text in .md
                    .alt("")
                )
            ),
            .i(.style("padding-bottom:\(calculatedPaddingBottom)%")),
            .style("""
                width:\(calculatedWidth)px;
                flex-grow:\(calculatedWidth)
                """)
        )
    }
}
