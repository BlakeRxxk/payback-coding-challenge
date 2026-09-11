// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main")
    ],
    targets: [
        .target(
            name: "Core"),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)