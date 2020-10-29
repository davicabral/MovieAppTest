//
//  TMDBUrlEncoder.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 30/09/18.
//  Copyright © 2018 Davi Cabral de Oliveira. All rights reserved.
//

import Foundation

struct TMDBUrlEncoder {
    
    static func encode(_ urlComponents: inout URLComponents, withParameters params: [TMDBQueryParameter]) {
        urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    }
}
