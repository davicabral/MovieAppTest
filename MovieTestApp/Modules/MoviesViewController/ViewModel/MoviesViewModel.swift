//
//  MoviesViewModel.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit
import TMDBKit

class MoviesViewModel: MoviewViewModelProtocol {
    
    var title: String { type.rawValue }
    
    var barIcon: UIImage? { type.barIconImage }
    
    private(set) var type: TMDBSearchType
    
    init(type: TMDBSearchType) {
        self.type = type
    }
    
    
}
