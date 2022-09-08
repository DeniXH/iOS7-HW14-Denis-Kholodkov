//
//  SceneDelegate.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 05.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene) // написать в  notion
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
    }
}

