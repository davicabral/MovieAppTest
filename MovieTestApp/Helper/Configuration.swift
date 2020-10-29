//
//  Configuration.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missingKey
    }
    
    enum ConfigurationKeys: String {
        case API_KEY
    }

    static func value<T>(for key: ConfigurationKeys, castType: T.Type) throws -> T {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key.rawValue) as? T else {
            throw Error.missingKey
        }

        return object
    }
}

enum API {
    
    enum Error: Swift.Error {
        case missingApiKey
    }
    
    static func apiKey() throws -> String {
        do {
            return try Configuration.value(for: .API_KEY, castType: String.self)
        } catch {
            throw Error.missingApiKey
        }
    }
}
