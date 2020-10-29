//
//  TMDBQueryParameter.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

public enum TMDBQueryParameter {
    case appendToResponse([TMDBAppendToResponse])
    case apiKey(String)
    case language(String)
    case page(Int)
    
    var key: String {
        switch self {
        case .appendToResponse:
            return "append_to_response"
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
        case .appendToResponse(let additions):
            return additions.map { $0.rawValue }.joined(separator: ",")
        case .language(let language):
            return language
        case .apiKey(let apiKey):
            return apiKey
        case .page(let page):
            return String(page)
        }
    }
}

public enum TMDBAppendToResponse: String {
    case accountStates
    case alternativeTitles
    case images
    case videos
    case credits
}
