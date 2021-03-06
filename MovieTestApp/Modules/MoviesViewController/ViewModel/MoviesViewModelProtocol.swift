//
//  MoviesViewModelProtocol.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import UIKit
import TMDBKit

protocol MoviesViewModelProtocol: class {
    
    var title: String { get }
    var barIcon: UIImage? { get }
    var barIconFilled: UIImage? { get }
    var type: TMDBSearchType { get }
    var numberOfMovies: Int? { get }
    var isLoading: Bool { get }
    
    var didLoadMovies: (() -> Void)? { get set }
    var didUpdateMovies: (([IndexPath]) -> Void)? { get set }
    var didChangeLoadingState: ((Bool) -> Void)? { get set }
    
    func movie(from indexPath: IndexPath) -> TMDBMovie
    func loadMovies()
    func loadMoreMovies()
    
    func isMovieLoading(at indexPath: IndexPath) -> Bool

}
