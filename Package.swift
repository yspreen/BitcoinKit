// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "BitcoinKit",
    products: [
        .library(name: "BitcoinKit", targets: ["BitcoinKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMinor(from: "3.1.5001")),
        .package(url: "https://github.com/Boilertalk/secp256k1.swift", .upToNextMinor(from: "0.1.0")),
        .package(url: "https://github.com/vapor-community/random.git", .upToNextMinor(from: "1.2.0"))
    ],
    targets: [
        .target(
            name: "BitcoinKit",
            dependencies: ["BitcoinKitPrivate", "secp256k1", "Random"]
        ),
        .target(
            name: "BitcoinKitPrivate",
            dependencies: ["COpenSSL", "secp256k1"]
        ),
        .testTarget(
            name: "BitcoinKitTests",
            dependencies: ["BitcoinKit"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
