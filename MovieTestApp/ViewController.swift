//
//  ViewController.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import UIKit
import TMDBKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        let movieService = TMDBMovieService()
        movieService.listMovies(searchType: .nowPlaying) { movies, total, error in
            movies?.forEach {
                print($0.title)
                print($0.overview)
                print($0.posterImage(withSize: .w500))
            }
        }
    }


}

