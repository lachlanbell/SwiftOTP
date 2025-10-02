// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SwiftOTP",
    platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6)
	],
	products: [
		.library(name: "SwiftOTP", targets: ["SwiftOTP"]),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-crypto.git", from: "3.0.0")
	],
	targets: [
		.target(
			name: "SwiftOTP",
			dependencies: [
				.product(name: "Crypto", package: "swift-crypto"),
			]
		),
		.testTarget(
			name: "SwiftOTPTests",
			dependencies: [
				.target(name: "SwiftOTP"),
			]
		)
    ]
)
