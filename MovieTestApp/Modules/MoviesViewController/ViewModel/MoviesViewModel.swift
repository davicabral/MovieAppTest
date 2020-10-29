//
//  MoviesViewModel.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit
import TMDBKit

class MoviesViewModel: MoviesViewModelProtocol {
    
    var title: String { type.rawValue }
    
    var barIcon: UIImage? { type.barIconImage }
    var barIconFilled: UIImage? { type.selectedBarIconImage }
    
    private(set) var type: TMDBSearchType
    
    init(type: TMDBSearchType) {
        self.type = type
    }
    
    
}
