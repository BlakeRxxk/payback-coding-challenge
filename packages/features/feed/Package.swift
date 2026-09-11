// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feed",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "FeedAPI",
            targets: ["FeedAPI"]),
        .library(
            name: "FeedImplementation",
            targets: ["FeedImplementation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main"),
        .package(name: "Transactions", path: "../transactions"),
        .package(name: "Core", path: "../../core"),
    ],
    targets: [
        .target(
            name: "FeedAPI",
            dependencies: [
                .product(name: "TransactionsAPI", package: "Transactions"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
        .target(
            name: "FeedImplementation",
            dependencies: [
                "FeedAPI",
                .product(name: "TransactionsAPI", package: "Transactions"),
                .product(name: "Core", package: "Core"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
        .testTarget(
            name: "FeedTests",
            dependencies: ["FeedAPI"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
    ])
