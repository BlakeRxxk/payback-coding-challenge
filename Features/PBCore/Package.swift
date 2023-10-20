// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PBCore",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "PBCore",
            targets: ["PBCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main")
    ],
    targets: [
        .target(
            name: "PBCore"),
        .testTarget(
            name: "PBCoreTests",
            dependencies: ["PBCore"]),
    ]
)
