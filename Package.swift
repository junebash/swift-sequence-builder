// swift-tools-version: 5.7
import PackageDescription

let package = Package(
  name: "swift-sequence-builder",
  platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
  products: [
    .library(
      name: "SequenceBuilder",
      targets: ["SequenceBuilder"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SequenceBuilder",
      dependencies: []
    ),
    .testTarget(
      name: "SequenceBuilderTests",
      dependencies: ["SequenceBuilder"]
    ),
  ]
)
