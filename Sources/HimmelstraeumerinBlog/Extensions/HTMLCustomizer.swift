import Foundation

public enum HTMLCustomizer {

	/// Add an identifier to HTML headings elements, so they can be used as a HTML Anchor.
	/// - Parameters:
	///   - html: The html input, like "<h4>Closed Captions</h4>"
	///   - markdown: The markdown input, like "#### Closed Captions"
	/// - Returns: A new html element with the identifier
	public static func addIdentifierToHeading(html: String, markdown: Substring) -> String {
		
		// output: "Closed Captions"
		let headerText = String(
			html
				.dropFirst(4)
				.dropLast(5)
		)

		// output: "closed-captions"
		let formattedHeaderText = headerText
			.lowercased()
			.replacingOccurrences(of: " ", with: "-")

		var result = ""

		// output: "<h4"
		let headingLevel = String(html.prefix(3))
		result.append(headingLevel)

		// output: "<h4 id="
		result.append(" id=")

		// output: "<h4 id="closed-captions"
		result.append("""
			"\(formattedHeaderText)"
		""")

		// output: "<h4 id="closed-captions">"
		result.append(">")

		// output: "<h4 id="closed-captions">Closed Captions"
		result.append(headerText)

		// output: "<h4 id="closed-captions">Closed Captions</h4>"
		let closingHeadingLevel = String(html.suffix(5))
		result.append(closingHeadingLevel)

		// output: "<h4 id="closed-captions">Closed Captions</h4>"
		return result
	}
}
