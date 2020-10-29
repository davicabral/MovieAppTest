//
//  MoviesViewController.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

class MoviesViewController: UIViewController {

    var viewModel: MoviesViewModelProtocol?
    
    convenience init(viewModel: MoviesViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.title = viewModel.title
        self.tabBarItem.image = viewModel.barIcon
        self.tabBarItem.selectedImage = viewModel.barIconFilled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
