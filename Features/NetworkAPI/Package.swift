// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NetworkAPI",
            targets: ["NetworkAPI"]),
        .library(
            name: "NetworkImplementation",
            targets: ["NetworkImplementation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main")
    ],
    targets: [
        .target(name: "NetworkAPI", dependencies: []),
        .target(name: "NetworkImplementation", dependencies: ["NetworkAPI"]),
        .testTarget(
            name: "NetworkAPITests",
            dependencies: ["NetworkAPI"]),
    ]
)
