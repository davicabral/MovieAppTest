//
//  TMDBRoute.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

struct TMDBMoviesResponse: Decodable, TMDBResponse {
    var result: [TMDBMovie]?
    var error: TMDBError?
    var success: Bool?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case result = "results"
        case success
        case error = "status_code"
        case totalResults = "total_results"
    }
}
