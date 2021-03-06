//
//  SceneDelegate.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    
    let viewController = ViewController()
    let viewModel = ViewModel()
    viewController.viewModel = viewModel
    
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
}

