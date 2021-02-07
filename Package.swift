// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwiftOTP",
    platforms: [
        .macOS(.v10_12), .iOS(.v9), .tvOS(.v9), .watchOS(.v4)
    ],
    products: [
        .library(name: "SwiftOTP", targets: ["SwiftOTP"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(name: "SwiftOTP", dependencies: ["CryptoSwift"], path: "SwiftOTP/"),
    ]
)
