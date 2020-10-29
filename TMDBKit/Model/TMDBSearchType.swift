//
//  TMDBRoute.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

public enum TMDBSearchType: String, CaseIterable {
    
    case nowPlaying = "now_playing"
    case upcoming

    func route(parameter: TMDBQueryParameter) -> TMDBRoutes {
        switch self {
        case .nowPlaying:
            return .nowPlaying(parameter)
        case .upcoming:
            return .upcoming(parameter)
        }
    }
}
