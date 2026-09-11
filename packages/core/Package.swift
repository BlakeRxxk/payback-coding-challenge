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
            name: "Core",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ],
            plugins: [.plugin(name: "FormatSwift", package: "swift-style-guide")]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ],
            plugins: [.plugin(name: "FormatSwift", package: "swift-style-guide")]),
    ]
)