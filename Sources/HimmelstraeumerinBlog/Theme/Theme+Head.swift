//
//  Theme+Head.swift
//  
//
//  Created by Felizia Bernutz on 02.05.20.
//

import Publish
import Plot

extension Node where Context == HTML.DocumentContext {
	static func head<T: Website>(for site: T, on location: Location) -> Node {
		return .head(for: location, on: site, stylesheetPaths: [
			"/styles.css",
			"https://fonts.googleapis.com/css2?family=Baloo+Bhaina+2:wght@600&display=swap",
			"https://fonts.googleapis.com/css2?family=Rubik:wght@500;700&display=swap",
			"https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400&display=swap",
			"https://fonts.googleapis.com/css2?family=Gentium+Basic:wght@400;700&display=swap"
		])
	}
}
