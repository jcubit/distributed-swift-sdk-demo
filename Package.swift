// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "distributed-swift-sdk-demo",
    platforms: [.macOS(.v15)],
    products: [
      .executable(name: "App", targets: ["App"]),
      .library(name: "Shared",targets: ["Shared"]),
      .library(name: "Service",targets: ["Service"]),
    ],
    dependencies: [
      .package(url: "https://github.com/jcubit/swift-distributed-actors.git", branch: "swift-sdk-linux"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "App",
            dependencies: [
              .product(name: "DistributedCluster", package: "swift-distributed-actors"),
              .target(name: "Service"),
              .target(name: "Shared")
            ],
            path: "Sources/App"
        ),
        .target(
            name: "Shared",
            dependencies: [
              .product(name: "DistributedCluster", package: "swift-distributed-actors"),
            ],
            path: "Sources/Shared"
        ),
        .target(
            name: "Service",
            dependencies: [
              .product(name: "DistributedCluster", package: "swift-distributed-actors"),
              .target(name: "Shared")
            ],
            path: "Sources/Service"
        )
    ]
)
