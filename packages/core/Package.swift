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
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main"),
        .package(url: "https://github.com/uber/RIBs-iOS", from: "1.0.0"),
        .package(url: "https://github.com/uber/needle", from: "0.25.0"),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "RIBs", package: "RIBs-iOS"),
                .product(name: "NeedleFoundation", package: "needle"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
    ])
