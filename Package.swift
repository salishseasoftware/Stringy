// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Stringy",
    products: [
        .library(
            name: "LibStringy",
            targets: ["LibStringy"]),
        .executable(
            name: "stringy",
            targets: ["stringy"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            from: "0.3.0"),
    ],
    targets: [
        .target(
            name: "LibStringy",
            dependencies: []),
        .testTarget(
            name: "LibStringyTests",
            dependencies: ["LibStringy"]),
        .target(
            name: "stringy",
            dependencies: [
                "LibStringy",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "stringyTests",
            dependencies: ["stringy"])
    ]
)
