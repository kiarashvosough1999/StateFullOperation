// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StateFullOperation",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v5),
        .macOS(.v10_10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "StateFullOperation",
            targets: ["StateFullOperation"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "StateFullOperation",
            path: "Source",
            exclude: ["Info.plist", "../resources", "../macOS-Example", "../IOS-Example"],
            linkerSettings: [
                .linkedFramework("Foundation",
                               .when(platforms: [
                                .iOS,
                                .macOS,
                                .tvOS,
                                .watchOS
                               ]))
            ]),
        .testTarget(
            name: "StateFullOperationTests",
            dependencies: ["StateFullOperation"],
            path: "Tests",
            exclude: ["Info.plist", "../resources", "../macOS-Example", "../IOS-Example"]),
    ]
)
