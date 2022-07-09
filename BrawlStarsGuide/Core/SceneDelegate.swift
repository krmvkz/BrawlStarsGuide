//
//  SceneDelegate.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 07.07.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = MainViewController()
        window?.rootViewController = viewController
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
    }
    
}

