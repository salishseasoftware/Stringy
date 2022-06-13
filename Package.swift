// swift-tools-version:5.5

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
            from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LibStringy",
            dependencies: []),
        .testTarget(
            name: "LibStringyTests",
            dependencies: ["LibStringy"]),
        .executableTarget(
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
