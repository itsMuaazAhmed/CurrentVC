// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.9
let package = Package(
    name: "CurrentVC",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CurrentVC",
            targets: ["CurrentVC"] // 👈 target name defines the module name
        ),
    ],
    targets: [
        .target(
            name: "CurrentVC",
            path: "Sources"
        )
    ]
)
