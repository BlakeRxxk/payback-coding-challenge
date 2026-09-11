// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Transactions",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "TransactionsAPI",
            targets: ["TransactionsAPI"]),
        .library(
            name: "TransactionsImplementation",
            targets: ["TransactionsImplementation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main"),
        .package(name: "Networking", path: "../../networking"),
        .package(name: "Core", path: "../../core"),
        .package(name: "DesignSystem", path: "../../design-system"),
    ],
    targets: [
        .target(name: "TransactionsAPI", dependencies: [],
                swiftSettings: [
                    .enableExperimentalFeature("StrictConcurrency"),
                ],
                plugins: [.plugin(name: "FormatSwift", package: "swift-style-guide")]),
        .target(
            name: "TransactionsImplementation",
            dependencies: [
                "TransactionsAPI",
                .product(name: "NetworkingAPI", package: "Networking"),
                .product(name: "Core", package: "Core"),
                .product(name: "DesignSystem", package: "DesignSystem"),
            ],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .enableExperimentalFeature("StrictConcurrency"),
            ],
            plugins: [.plugin(name: "FormatSwift", package: "swift-style-guide")]
        ),
        .testTarget(
            name: "TransactionsTests",
            dependencies: ["TransactionsImplementation"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ],
            plugins: [.plugin(name: "FormatSwift", package: "swift-style-guide")]),
    ]
)