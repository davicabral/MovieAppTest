//
//  TMDBRoute.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

open class TMDBMovie: Decodable {
    
    public var id: Int
    public var isAdult: Bool
    public var overview: String
    public var releaseDate: String
    public var originalTitle: String
    public var originalLanguage: String
    public var title: String
    public var popularity: Double
    public var voteCount: Int
    public var voteAverage: Double
    var posterPath: String?
    var backdropPath: String?
    
    public func posterImage(withSize size: TMDBPosterSize) -> URL? {
        guard let posterPath = self.posterPath else { return nil }
        return TMDBImage.pathFrom(imagePath: posterPath, withSize: size)
    }

    public func backdropImage(withSize size: TMDBBackdropSize) -> URL? {
        guard let posterPath = self.backdropPath else { return nil }
        return TMDBImage.pathFrom(imagePath: posterPath, withSize: size)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case isAdult = "adult"
        case overview
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    
}
