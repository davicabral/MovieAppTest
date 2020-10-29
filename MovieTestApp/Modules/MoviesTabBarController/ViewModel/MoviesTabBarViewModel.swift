//
//  MoviesTabBarViewModel.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit
import TMDBKit

struct MoviesTabBarViewModel: MoviesTabBarViewModelProtocol {
    
    var tintColor: UIColor { Colors.app.color }
    
    var viewControllers: [UIViewController] {
        types.map {
            let viewModel = MoviesViewModel(type: $0)
            let controller = MoviesViewController(viewModel: viewModel)
            controller.tabBarItem.tag = TMDBSearchType.allCases.firstIndex(of: $0)!
            let navigation = UINavigationController(rootViewController: controller)
            return navigation
        }
    }
    
    var types: [TMDBSearchType]
    
    init(types: [TMDBSearchType]) {
        self.types = types
    }

}
