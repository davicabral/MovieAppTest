//
//  MoviesTabBarViewModelProtocol.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit

protocol MoviesTabBarViewModelProtocol {
    var viewControllers: [UIViewController] { get }
    var tintColor: UIColor { get }
}
