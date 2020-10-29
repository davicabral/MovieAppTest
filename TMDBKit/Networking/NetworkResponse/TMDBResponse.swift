//
//  TMDBResponse.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

protocol TMDBResponse {
    associatedtype ResponseObject
    var result: ResponseObject? {get set}
    var error: TMDBError? {get set}
    var success: Bool? {get set}
    var totalResults: Int? {get set}
}
