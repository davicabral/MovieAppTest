//
//  MovieDetailsViewModelProtocol.swift
//  MovieTestApp
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import Foundation

protocol MovieDetailsViewModelProtocol {
    
    var title: String { get }
    var backdropUrl: URL? { get }
    var posterUrl: URL? { get }
    var overview: String? { get }
}
