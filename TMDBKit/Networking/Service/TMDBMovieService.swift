//
//  TMDBMovieService.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

public struct TMDBMovieService: MovieServiceProtocol {
    
    public init() {}
    
    public func listMovies(searchType: TMDBSearchType, page: Int = 1, completion: @escaping ([TMDBMovie]?, Int?, Error?) -> ()) {
        let route = searchType.route(parameter: .page(page))
        let service = TMDBService()
        service.fetchData(fromURL: route.url, ofType: TMDBMoviesResponse.self) { result in
            switch result {
                case .success(let response):
                    completion(response.result, response.totalResults, nil)
                case .failure(let error):
                    completion(nil, nil, error)
                }
        }
    }
    
}
