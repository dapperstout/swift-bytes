// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "SwiftBytes",
    products: [
        .library(
            name: "SwiftBytes",
            targets: ["SwiftBytes"]
        )
    ],
    targets: [
        .target(
            name: "SwiftBytes",
            path: "SwiftBytes/SwiftBytes",
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "SwiftBytesTests",
            dependencies: ["SwiftBytes"],
            path: "SwiftBytes/SwiftBytesTests",
            exclude: [
                "Info.plist"
            ]
        )
    ]
)


