//
//  MoviesTabBarController.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

class MoviesTabBarController: UITabBarController {

    private var viewModel: MoviesTabBarViewModelProtocol?
    
    convenience init(viewModel: MoviesTabBarViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        tabBar.tintColor = viewModel.tintColor
        viewControllers = viewModel.viewControllers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
