// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextCaptureCLI",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "text-capture", targets: ["TextCaptureCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
        .package(url: "https://github.com/pepebecker/text-capture-server", from: "0.1.0")
    ],
    targets: [
        .executableTarget(name: "TextCaptureCLI", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "TextCaptureServer", package: "text-capture-server")
        ]),
    ]
)