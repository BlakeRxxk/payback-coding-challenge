// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main"),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
    ])
