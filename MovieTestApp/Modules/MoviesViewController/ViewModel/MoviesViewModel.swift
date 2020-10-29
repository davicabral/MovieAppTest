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
    
    private var currentPage = 1
    private(set) var numberOfMovies: Int?
    
    private(set) var type: TMDBSearchType
    private var movies: [TMDBMovie] = [] {
        didSet {
            didMoviesUpdated?(movies)
        }
    }
    
    // Binding Closures
    var didMoviesUpdated: (([TMDBMovie]) -> Void)?
    
    private let service: MovieServiceProtocol
    
    init(type: TMDBSearchType, service: MovieServiceProtocol = TMDBMovieService()) {
        self.type = type
        self.service = service
    }
    
    func movie(from indexPath: IndexPath) -> TMDBMovie { movies[indexPath.row] }
    
    func loadMovies() {
        service.listMovies(searchType: type, page: currentPage) { [weak self] movies, totalNumberMovies, error in
            if let movies = movies, let numberOfMovies = totalNumberMovies {
                self?.numberOfMovies = numberOfMovies
                self?.movies = movies
            }
        }
    }
    
    func loadMoreMovies() {
        currentPage += 1
        service.listMovies(searchType: type, page: currentPage) { [weak self] movies, totalNumberMovies, error in
            if let movies = movies, let numberOfMovies = totalNumberMovies {
                self?.numberOfMovies = numberOfMovies
                self?.movies += movies
            }
        }
    }
    
    func isMovieLoading(at indexPath: IndexPath) -> Bool {
        return indexPath.row >= self.movies.count
    }
    
}
