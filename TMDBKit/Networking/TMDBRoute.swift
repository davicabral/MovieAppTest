//
//  TMDBRoute.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

public enum TMDBRoutes {
    
    case moviesGenre
    case movie(id: Int, parameters: [TMDBQueryParameter]?)
    case nowPlaying(TMDBQueryParameter)
    case upcoming(TMDBQueryParameter)
    
    private var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        var result = "/3"
        switch self {
        case .moviesGenre:
            result += "/genre/movie/list"
        case .movie(let id,_):
            result += "/movie/\(id)"
        case .nowPlaying:
            result += "/movie/now_playing"
        case .upcoming:
            result += "/movie/upcoming"
        }
        
        return result
    }
    
    var url: URL {
        switch self {
        case .movie(_, let parameters):
            return url(path: path, parameters: parameters)
        case .nowPlaying(let parameter), .upcoming(let parameter):
            return url(path: path, parameters: [parameter])
        default:
            return url(path: self.path)
        }
        
    }
    
    private func url(path: String, parameters: [TMDBQueryParameter]? = nil) -> URL {
        
        guard var urlComponents = URLComponents(string: baseURL) else {
            fatalError("Invalid URL to create URLComponents")
        }
        
        guard let apiKey = TMDBConfiguration.apiKey else { fatalError("It is necessary to register ApiKey") }
        
        var queryParameters: [TMDBQueryParameter] = [.apiKey(apiKey), .language(TMDBConfiguration.language)]
        parameters?.forEach { queryParameters.append($0) }
        urlComponents.path = path
        
        TMDBUrlEncoder.encode(&urlComponents, withParameters: queryParameters)
        return urlComponents.url!
    }
}
