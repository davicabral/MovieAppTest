//
//  TMDBRoute.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

struct TMDBUrlEncoder {
    
    static func encode(_ urlComponents: inout URLComponents, withParameters params: [TMDBQueryParameter]) {
        urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
