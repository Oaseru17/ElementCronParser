// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cronparser",
    defaultLocalization: "en",
    products: [
           .executable(name: "cronparser", targets: ["cronparser"])
       ],
       dependencies: [
           .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1")
       ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "cronparser",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")],
            resources: [.process("SupportFiles/Localization"), .process("Resources")]
            ),
        .testTarget(
            name: "cronparserTests",
            dependencies: ["cronparser"]),
    ]
)
