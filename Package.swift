// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenPR",
    dependencies: [
        .package(url: "https://github.com/DIY-Team/install-swift-script.git", from: "0.0.1"),
        .package(url: "https://github.com/DIY-Team/RunsShellCommand", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "OpenPR",
            dependencies: ["OpenPRCore", "InstallSwiftScriptCore"]),
        .target(
            name: "OpenPRCore", dependencies: ["RunsShellCommand"])
    ]
)
