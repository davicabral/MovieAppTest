//
//  TMDBSearchType.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 27/09/18.
//  Copyright © 2018 Davi Cabral de Oliveira. All rights reserved.
//

import Foundation

public enum TMDBSearchType: String, CaseIterable {
    
    case nowPlaying
    case upcoming

    func endpoint(parameter: TMDBQueryParameter) -> TMDBRoutes {
        switch self {
        case .nowPlaying:
            return TMDBRoutes.nowPlaying(parameter)
        case .upcoming:
            return TMDBRoutes.upcoming(parameter)
        }
    }
}
