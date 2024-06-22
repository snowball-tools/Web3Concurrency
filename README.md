# Web3Concurrency

Web3Concurrency is a Swift library built upon [Web3.swift](https://github.com/Boilertalk/Web3.swift) for interacting with Ethereum smart contracts. This library adds support for Swift's structured concurrency.

## Installation

### Swift Package Manager

To include Web3Concurrency in your project, add the following dependency to your `Package.swift` file:

```swift
// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "MyProject",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "MyProject",
            targets: ["MyProject"]),
    ],
    dependencies: [
        .package(url: "https://github.com/snowball-tools/Web3Concurrency", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MyProject",
            dependencies: [
                .product(name: "Web3Concurrency", package: "Web3Concurrency"),
            ]
        ),
        .testTarget(
            name: "MyProjectTests",
            dependencies: ["MyProject"]),
    ]
)

## License

Web3Concurrency is available under the MIT license. See the LICENSE file for more info.