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
            .span("Tagged with: "),
            .tagList(for: item, on: site)
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func blogPostDetail(_ item: Item<HimmelstraeumerinBlog>) -> Self {
        return .div(
            .class("content post-detail"),
            .p(
                .class("release-date"),
                .text("\(item.date.formatted) ⋅ \(Int(item.readingTime.minutes.rounded())) min read")
            ),
            .contentBody(item.body)
        )
    }

    static func sketchnoteDetail(_ item: Item<HimmelstraeumerinBlog>) -> Self {
        return .div(
            .class("content sketchnote-detail"),
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
        )
    }
}
