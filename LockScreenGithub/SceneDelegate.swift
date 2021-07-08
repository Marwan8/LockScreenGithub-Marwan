//
//  SceneDelegate.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 20.02.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let patternModule = UnlockPatternBuilder().build()
            window.rootViewController = UINavigationController(rootViewController: patternModule)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

