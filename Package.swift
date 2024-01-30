// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SwiftOTP",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(name: "SwiftOTP", targets: ["SwiftOTP"]),
        .library(name: "SwiftOTP-Dynamic", type: .dynamic, targets: ["SwiftOTP"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" 
..< "4.0.0")
    ],
    targets: [
        .target(name: "SwiftOTP", dependencies: ["Crypto"], path: "SwiftOTP/"),
        .testTarget(name: "SwiftOTPTests", dependencies: ["SwiftOTP"])
    ]
)
