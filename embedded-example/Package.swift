// swift-tools-version: 6.3
import PackageDescription

let package = Package(
  name: "EmbeddedExample",
  platforms: [.macOS(.v15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
  products: [
    .executable(
      name: "EmbeddedHello",
      targets: ["EmbeddedHello"]
    ),
  ],
  dependencies: [
    .package(path: ".."),
  ],
  targets: [
    .executableTarget(
      name: "EmbeddedHello",
      dependencies: [
        .product(name: "Swift", package: "swift"),
        .product(name: "_Builtin_float", package: "swift"),
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags([
            "-nostdimport", "-nostdlibimport",
          ])
      ]
    ),
  ]
)
