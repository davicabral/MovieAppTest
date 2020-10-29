//
//  MovieCollectionCellViewModel.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import Foundation
import TMDBKit

struct MovieCollectionCellViewModel {
    
    private let movie: TMDBMovie
    
    init(_ movie: TMDBMovie) {
        self.movie = movie
    }
    
    var posterImageUrl: URL? { movie.posterImage(withSize: .w500) }
    
    var title: String { movie.title }
}
