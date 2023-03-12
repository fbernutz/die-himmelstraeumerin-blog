import SplashPublishPlugin
import ReadingTimePublishPlugin
import Ink

try HimmelstraeumerinBlog().publish(
	using: [
		.installPlugin(.splash(withClassPrefix: "")),
		.step(named: "Add Identifiers to Headings") { context in
			var markdownParser = MarkdownParser()
			let modifier = Modifier(target: .headings) { html, markdown in
				HTMLCustomizer.addIdentifierToHeading(html: html, markdown: markdown)
			}
			markdownParser.addModifier(modifier)
			context.markdownParser = markdownParser
		},
		.addMarkdownFiles(),
		.installPlugin(.readingTime()),
		.copyResources(),
		.generateHTML(withTheme: .himmelstraeumerin, indentation: .tabs(2)),
		.generateRSSFeed(including: [.posts]),
		.generateSiteMap(indentedBy: .tabs(2))
	]
)
