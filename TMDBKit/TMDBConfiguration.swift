//
//  TMDBConfiguration.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

public struct TMDBConfiguration {
    
    static var apiKey: String?
    static var language: String = "en-US"
    
    private init(){}
    
    public static func setup(withKey key: String, andLanguage language: String = "en-US") {
        TMDBConfiguration.apiKey = key
    }
}
