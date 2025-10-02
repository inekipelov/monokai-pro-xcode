// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "MonokaiProXcode",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "monokai-pro-xcode",
            targets: ["MonokaiProXcode"]
        )
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "MonokaiProXcode",
            resources: [
                .copy("Themes")
            ]
        )
    ]
)
