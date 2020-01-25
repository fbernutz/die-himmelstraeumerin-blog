// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "HimmelstraeumerinBlog",
    products: [
        .executable(name: "HimmelstraeumerinBlog", targets: ["HimmelstraeumerinBlog"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.2.0"),
        .package(url: "https://github.com/johnsundell/splashpublishplugin", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "HimmelstraeumerinBlog",
            dependencies: [
                "Publish",
                "SplashPublishPlugin"
            ]
        )
    ]
)
