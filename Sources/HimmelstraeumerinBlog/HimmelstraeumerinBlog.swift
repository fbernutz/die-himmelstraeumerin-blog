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
		case iOS = "ios"
		case sketchnotes
		case speaking
		case about
	}

	struct ItemMetadata: WebsiteItemMetadata {
		// Add any site-specific metadata that you want to use here.
		let sketchnoteMetadata: SketchnoteMetadata?
	}

	struct SketchnoteMetadata: WebsiteItemMetadata {
		let contentCreator: String?
		let linkToContentCreator: String?
	}

	// Update these properties to configure your website:
	var url = URL(string: "https://fbernutz.github.io")!
	var name = "#DieHimmelstraeumerin"
	var description = "iOS dev • sketchnoting • accessibility • pineapple on pizza • sports • she/her"
	var language: Language { .english }
	var favicon: Favicon? { Favicon() }
	var imagePath: Path? { "images/preview.jpg" }
}
