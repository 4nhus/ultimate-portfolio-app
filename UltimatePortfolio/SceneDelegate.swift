//
//  SceneDelegate.swift
//  UltimatePortfolio
//
//  Created by Anh on 6/19/24.
//

import SwiftUI

#if os(iOS)
class SceneDelegate: NSObject, UIWindowSceneDelegate {
    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        guard let url = URL(string: shortcutItem.type) else {
            completionHandler(false)
            return
        }

        windowScene.open(url, options: nil, completionHandler: completionHandler)
    }

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
            if let shortCutItem = connectionOptions.shortcutItem {
                if let url = URL(string: shortCutItem.type) {
                    scene.open(url, options: nil)
                }
            }
    }
}
#endif
