// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MsgerDataStore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "MsgerDataStore",
            type: .dynamic,
            targets: ["MsgerDataStore"]
        ),
    ],
    dependencies: [
        .package(name: "XUI", path: "./XUI"),
    ],
    targets: [
        .target(
            name: "MsgerDataStore",
            path: "."
        )
    ]
)
