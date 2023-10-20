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
        .package(name: "TransactionsAPI", path: "../Transactions"),
        .package(name: "PBCore", path: "../PBCore"),
    ],
    targets: [
        .target(
            name: "FeedAPI", dependencies: ["TransactionsAPI"]),
        .target(
            name: "FeedImplementation", dependencies: ["FeedAPI", "TransactionsAPI", "PBCore"]),
        .testTarget(
            name: "FeedTests",
            dependencies: ["FeedAPI"]),
    ]
)
