//
//  SceneDelegate.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import UIKit
import TMDBKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        do {
            let apiKey = try API.apiKey()
            TMDBConfiguration.register(withKey: apiKey)
            window = UIWindow(windowScene: windowScene)
            let viewModel = MoviesTabBarViewModel(types: TMDBSearchType.allCases)
            let controller = MoviesTabBarController(viewModel: viewModel)
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
        } catch {
            print(error)
        }
    }
}

