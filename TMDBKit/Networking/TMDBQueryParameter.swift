//
//  TMDBQueryParameter.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

public enum TMDBQueryParameter {
    case apiKey(String)
    case language(String)
    case page(Int)
    
    var key: String {
        switch self {
        case .apiKey:
            return "api_key"
        default:
            guard let label = Mirror(reflecting: self).children.first?.label else {
                return .init(describing: self)
            }
            return label
        }
        
    }
    
    var value: String {
        switch self {
        case .language(let language):
            return language
        case .apiKey(let apiKey):
            return apiKey
        case .page(let page):
            return String(page)
        }
    }
}
