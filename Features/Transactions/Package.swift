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
        .package(name: "NetworkAPI", path: "../NetworkAPI"),
        .package(name: "PBCore", path: "../PBCore"),
        .package(name: "PBUI", path: "../PBUI"),
    ],
    targets: [
        .target(name: "TransactionsAPI", dependencies: []),
        .target(
            name: "TransactionsImplementation",
            dependencies: ["TransactionsAPI", "NetworkAPI", "PBCore", "PBUI"],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release))
            ]
        ),
        .testTarget(
            name: "TransactionsTests",
            dependencies: ["TransactionsImplementation"]),
    ]
)
