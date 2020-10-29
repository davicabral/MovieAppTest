//
//  MovieServiceProtocol.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

public protocol MovieServiceProtocol {
    
    func listMovies(searchType: TMDBSearchType, page: Int, completion: @escaping (_ movieArray:[TMDBMovie]?, _ totalOfMovies: Int?, _ error: Error?) -> ())
}
