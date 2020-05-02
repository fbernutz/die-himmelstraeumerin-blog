//
//  HimmelstraeumerinBlog.swift
//  
//
//  Created by Felizia Bernutz on 02.05.20.
//

import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct HimmelstraeumerinBlog: Website {
	enum SectionID: String, WebsiteSectionID {
		case posts
		case sketchnotes
	}

	struct ItemMetadata: WebsiteItemMetadata {
		// Add any site-specific metadata that you want to use here.
		let contentCreator: String?
		let linkToContentCreator: String?
	}

	// Update these properties to configure your website:
	var url = URL(string: "https://fbernutz.github.io")!
	var name = "#diehimmels&shy;traeumerin"
	var description = "iOS dev • sketchnoting • photography • accessibility • pineapple on pizza • lioness • she/her"
	var language: Language { .english }
	var imagePath: Path? { nil }
}
