import SplashPublishPlugin
import ReadingTimePublishPlugin

try HimmelstraeumerinBlog().publish(
	using: [
		.installPlugin(.splash(withClassPrefix: "splash")),
		.addMarkdownFiles(),
		.installPlugin(.readingTime()),
		.copyResources(),
		.generateHTML(withTheme: .himmelstraeumerin, indentation: .tabs(2)),
		.generateSiteMap()
	]
)
