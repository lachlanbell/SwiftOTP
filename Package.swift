// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SwiftOTP",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(name: "SwiftOTP", targets: ["SwiftOTP"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "SwiftOTP", dependencies: ["Crypto"], path: "SwiftOTP/"),
        .testTarget(name: "SwiftOTPTests", dependencies: ["SwiftOTP"])
    ]
)
