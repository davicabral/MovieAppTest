//
//  MovieDetailsViewModel.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import Foundation
import TMDBKit

struct MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    
    private let movie: TMDBMovie
    
    var title: String { movie.title }
    
    var backdropUrl: URL? { movie.backdropImage(withSize: .w780)}
    
    var posterUrl: URL? { movie.posterImage(withSize: .w500)}
    
    var overview: String? { movie.overview}
    
    init(movie: TMDBMovie) {
        self.movie = movie
    }

}
