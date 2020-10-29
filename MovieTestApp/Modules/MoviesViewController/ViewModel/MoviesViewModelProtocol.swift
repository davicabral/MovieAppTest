//
//  MoviesViewModelProtocol.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit
import TMDBKit

protocol MoviewViewModelProtocol: class {
    
    var title: String { get }
    var barIcon: UIImage? { get }
    var type: TMDBSearchType { get }
    
    
}
