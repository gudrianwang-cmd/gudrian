// swift-tools-version: 5.9

// 这是一个 Swift Playgrounds 应用包：在 Mac 上用 Xcode 打开，或在 iPad 上用 Swift Playgrounds 打开即可运行。
import PackageDescription
import AppleProductTypes

let package = Package(
    name: "CRHExplorer",
    platforms: [
        .iOS("17.0")
    ],
    products: [
        .iOSApplication(
            name: "高铁探秘",
            targets: ["AppModule"],
            bundleIdentifier: "com.gudrian.crhexplorer",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .rocket),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
