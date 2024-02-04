// swift-tools-version:5.5

import PackageDescription

let package = Package(
	name: "HimmelstraeumerinBlog",
	platforms: [
		.macOS(.v12)
	],
	products: [
		.executable(name: "HimmelstraeumerinBlog", targets: ["HimmelstraeumerinBlog"])
	],
	dependencies: [
		.package(url: "https://github.com/johnsundell/publish.git", from: "0.2.0"),
		.package(url: "https://github.com/johnsundell/splashpublishplugin", from: "0.1.0"),
		.package(url: "https://github.com/alexito4/ReadingTimePublishPlugin", from: "0.1.0")
	],
	targets: [
		.executableTarget(
			name: "HimmelstraeumerinBlog",
			dependencies: [
				.product(name: "Publish", package: "Publish"),
				.product(name: "SplashPublishPlugin", package: "SplashPublishPlugin"),
				.product(name: "ReadingTimePublishPlugin", package: "ReadingTimePublishPlugin")
			]
		)
	]
)
