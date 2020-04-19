//
//  Theme+ItemDetail.swift
//  
//
//  Created by Felizia Bernutz on 26.03.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func itemDetail(for item: Item<HimmelstraeumerinBlog>, on site: HimmelstraeumerinBlog) -> Node {
        return .article(
            .if(item.sectionID == .sketchnotes,
                .sketchnoteDetail(item),
                else: .blogPostDetail(item)
            ),
            .div(
                .class("tags"),
                .span("Tagged with: "),
                .tagList(for: item, on: site)
            )
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func blogPostDetail(_ item: Item<HimmelstraeumerinBlog>) -> Self {
        let blogMetadata = item.date.formatted
            + " ⋅ "
            + "\(Int(item.readingTime.minutes.rounded()))"
            + " min read"

        return .div(
            .class("content post-detail"),
            .p(
                .class("release-date"),
                .text(blogMetadata)
            ),
            .contentBody(item.body)
        )
    }

    static func sketchnoteDetail(_ item: Item<HimmelstraeumerinBlog>) -> Self {
        return .div(
            .class("content sketchnote-detail"),
            .contentBody(item.body),
            .metaData(for: item),
            .sketchnoteOriginal(for: item)
        )
    }

    static func sketchnoteOriginal(for item: Item<HimmelstraeumerinBlog>) -> Self {
        return .p(
            .unwrap(item.imagePath) {
                .a(
                    .href($0.absoluteString.originalImagePath),
                    .target(.blank),
                    .img(
                        .src($0.absoluteString.originalImagePath),
                        .alt(item.description)
                    )
                )
            }
        )
    }

    static func metaData(for item: Item<HimmelstraeumerinBlog>) -> Self {
        let talkByText = "Content by"
        return .div(
            .class("metadata"),
            .unwrap(item.metadata.speaker) { speaker in
                .if(item.metadata.speakerLink != nil,
                    .p(
                        .text(talkByText),
                        .a(
                            .href(item.metadata.speakerLink ?? ""),
                            .text(speaker),
                            .target(.blank),
                            .rel(.noreferrer)
                        )
                    ), else:
                    .p(
                        .text("\(talkByText) \(speaker)")
                    )
                )
            },
            .p(
                .text("Sketch by"),
                .a(
                    .href("https://twitter.com/felibe444"),
                    .text("@felibe444"),
                    .target(.blank),
                    .rel(.noreferrer)
                )
            ),
            .p(
                .text("Created on \(item.date.formatted)")
            )
        )
    }

}
