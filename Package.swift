// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LayoutDSL",
	platforms: [
		.iOS(.v11), .tvOS(.v11)
	],
    products: [
        .library(
            name: "LayoutDSL",
            targets: ["LayoutDSL"]),
    ],
    targets: [
        .target(
            name: "LayoutDSL",
            dependencies: []),
        .testTarget(
            name: "LayoutDSLTests",
            dependencies: ["LayoutDSL"]),
    ]
)
