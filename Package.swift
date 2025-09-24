// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CurrentVC",
    // platforms: [
    //     .iOS(.v13) // UIKit support starts here, you can raise if needed
    // ],
    products: [
        .library(
            name: "CurrentVC",
            targets: ["CurrentVC"]
        ),
    ],
    targets: [
        .target(
            name: "CurrentVC"),
        .testTarget(
            name: "CurrentVCTests",
            dependencies: ["CurrentVC"]
        ),
    ]
)
