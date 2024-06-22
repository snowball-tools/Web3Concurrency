// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Web3Concurrency",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Web3Concurrency",
            targets: ["Web3Concurrency"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Boilertalk/Web3.swift", from: "0.8.8"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Web3Concurrency",
            dependencies: [
                .product(name: "Web3", package: "Web3.swift")
            ]
        ),
        .testTarget(
            name: "Web3ConcurrencyTests",
            dependencies: ["Web3Concurrency"]
        ),
    ]
)
