// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NetworkingAPI",
            targets: ["NetworkingAPI"]),
        .library(
            name: "NetworkingImplementation",
            targets: ["NetworkingImplementation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BlakeRxxk/swift-style-guide", branch: "main")
    ],
    targets: [
        .target(name: "NetworkingAPI", dependencies: [],
                swiftSettings: [
                    .enableExperimentalFeature("StrictConcurrency"),
                ]),
        .target(name: "NetworkingImplementation", dependencies: ["NetworkingAPI"],
                swiftSettings: [
                    .enableExperimentalFeature("StrictConcurrency"),
                ]),
        .testTarget(
            name: "NetworkingAPITests",
            dependencies: ["NetworkingAPI"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency"),
            ]),
    ]
)