// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CurrentVC",
    platforms: [
        .iOS(.v13)   // 👈 this tells SPM UIKit is allowed
    ],
    products: [
        .library(
            name: "CurrentVC",
            targets: ["CurrentVC"]),
    ],
    targets: [
        .target(
            name: "CurrentVC",
            dependencies: []),
        .testTarget(
            name: "CurrentVCTests",
            dependencies: ["CurrentVC"]),
    ]
)
