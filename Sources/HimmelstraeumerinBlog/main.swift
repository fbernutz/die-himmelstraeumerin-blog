import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct HimmelstraeumerinBlog: Website {
    enum SectionID: String, WebsiteSectionID {
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://fbernutz.github.io")!
    var name = "Die Himmels&shy;traeumerin"
    var description = "iOS dev • sketchnoting • photography • accessibility • pineapple on pizza • lioness • she/her"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try HimmelstraeumerinBlog().publish(
    using: [
        .installPlugin(.splash(withClassPrefix: "splash")),
        .addMarkdownFiles(),
        .copyResources(),
        .generateHTML(withTheme: .himmelstraeumerin, indentation: .tabs(2)),
        .generateSiteMap()
    ]
)
